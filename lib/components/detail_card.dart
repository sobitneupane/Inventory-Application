import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventoryapp/details/api_request/delete_details.dart';
import 'package:inventoryapp/details/screen/edit_form_details.dart';

class CustomDetailCard extends StatefulWidget {
  final String size;
  final int quantity;
  final String perSquareFeet;
  final String godown;
  final String thickness;
  final String productType;
  final int id;
  final String title;

  CustomDetailCard(this.productType, this.id, this.thickness, this.size,
      this.quantity, this.perSquareFeet, this.godown, this.title);

  @override
  _CustomDetailCardState createState() => _CustomDetailCardState();
}

class _CustomDetailCardState extends State<CustomDetailCard> {
  final _formK = GlobalKey<FormState>();
  int additionValue;

  @override
  Widget build(BuildContext context) {
    Widget popUpWidget(String txt) {
      return Form(
          key: _formK,
          child: AlertDialog(
            title: Text(txt,style: TextStyle(decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.double,decorationThickness: 2,letterSpacing: 2),),
            actions: <Widget>[
              Container(
                width: 260,
                padding: const EdgeInsets.only(left:10,right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                            width: 140,
                            child: Text(
                              "Number To "+txt+":"),
                            ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              setState(() {
                                additionValue = int.parse(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 30,bottom: 10,left: 10),
                          child: RaisedButton(
                            color: Colors.black26,
                            textColor: Colors.white,
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: new Text("Cancel"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30,right: 10,bottom: 10),
                          child: RaisedButton(
                              color: Colors.black26,
                              textColor: Colors.white,
                              onPressed: () {
                                _formK.currentState.save();
                                if (txt == "Add") {
                                  handleAddSub(
                                      context,
                                      widget.id,
                                      widget.quantity + additionValue,
                                      widget.productType);
                                } else {
                                  handleAddSub(
                                      context,
                                      widget.id,
                                      widget.quantity - additionValue,
                                      widget.productType);
                                }
                                Navigator.of(context).pop();
                              },
                              child: new Text("Save")),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ));
    }

    void _showDialog(String txt) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return popUpWidget(txt);
          });
    }

    return Align(
      child: Container(
          height: 164,
          width: 600,
          child: Scaffold(
            body: Card(
                margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              left: 10, top: 10),
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
//                        strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  text: "Size: " + widget.size)),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () => _showDialog("Add"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: RichText(
                                  overflow: TextOverflow.ellipsis,
//                        strutStyle: StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      text: "Quantity: " +
                                          widget.quantity.toString())),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10,top: 3),
                              child: RichText(
                                  overflow: TextOverflow.ellipsis,
//                        strutStyle: StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      text: "Price: " + widget.perSquareFeet)),
                            ),
                          ],
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                var initalValues = {
                                  'id': widget.id,
                                  'name': widget.title,
                                  'size': widget.size,
                                  'price': widget.perSquareFeet,
                                  'quantity': widget.quantity,
                                  'productType': widget.productType,
                                  'godown': widget.godown,
                                  'title': widget.title
                                };
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditItem(initalValues)),
                                );
                              },
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
//                        strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  text: "Godown: " + widget.godown)),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () => _showDialog("Subtract"),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          )),
    );
  }
}

void handleAddSub(context, int id, int val, String pType) async {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('Operating...'),
  ));
  var q = {"quantity": 0};
  try {
    q["quantity"] = val;
    var sentToServer = await updateDetails(pType, id, "add", q);

    if (sentToServer == true) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
        'Operation successfull!',
      )));
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Operation failed!')));
    }
  } catch (e) {
    print(e);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Operation failed!')));
  }
}
