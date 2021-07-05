import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventoryapp/add_item/api_request/fetch_form_details.dart';
import 'package:inventoryapp/add_item/model/beet_model.dart';
import 'package:inventoryapp/add_item/model/beet_name_model.dart';
import 'package:inventoryapp/add_item/model/others.dart';
import 'package:inventoryapp/add_item/model/others_name_model.dart';
import 'package:inventoryapp/add_item/model/plywood_model.dart';
import 'package:inventoryapp/add_item/screen/selectImage.dart';
import 'package:inventoryapp/product_category/screen/product_category_main.dart';

class EditItem extends StatelessWidget {
  final initialValues;

  EditItem(this.initialValues);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit " + initialValues["productType"]),
      ),
      body: FutureBuilder(
        future: fetchFormDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
          return snapshot.hasData
              ? EditProductTypeForm(snapshot.data, initialValues)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class EditProductTypeForm extends StatefulWidget {
  final data;
  final initialValues;

  EditProductTypeForm(this.data, this.initialValues);

  @override
  _EditProductTypeFormState createState() => _EditProductTypeFormState();
}

class _EditProductTypeFormState extends State<EditProductTypeForm> {
  final _formKey = GlobalKey<FormState>();
  final _formK = GlobalKey<FormState>();
  static List<dynamic> productType;
  static List<dynamic> plyThickness;
  static List<dynamic> plySize;
  static List<dynamic> beetName;
  static List<dynamic> othersName;
  static List<dynamic> beetSize;
  static List<dynamic> goDown;
  static Map<String, dynamic> formData;

//  static Map<String, dynamic> formDataPly;
//  static Map<String, dynamic> formDataBeet;
//  static Map<String, dynamic> formDataOthers;
  final Map<String, dynamic> formPopUpData = {
    'productType': null,
    'name': null,
    'image': null,
    'imageSelected': false
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productType = widget.data["productName"];
    plyThickness = widget.data["plyThickness"];
    plySize = widget.data["plySize"];
    beetName = widget.data["beetName"];
//    beetName.add("Add New");
    othersName = widget.data["othersName"];
//    othersName.add("Add New");
    beetSize = widget.data["beetSize"];
    goDown = widget.data["godown"];
    formData = {
      'name': widget.initialValues["name"],
      'size': widget.initialValues["size"].trim(),
      'productType': widget.initialValues["productType"],
      'quantity': widget.initialValues["quantity"],
      'price': widget.initialValues["price"],
      'godown': widget.initialValues["godown"],
      'id': widget.initialValues["id"]
    };
//    formDataPly = {
//      'name': widget.initialValues["name"],
//      'size': widget.initialValues["size"]
//    };
//    formDataBeet = {
//      'name': widget.initialValues["name"],
//      'size': beetSize[0]
//    };
//    formDataOthers = {
//      'name': othersName[0],
//      'size': null
//    };
  }

  @override
  Widget build(BuildContext context) {
//    Widget popUpWidget = Form(
//        key: _formK,
//        child:AlertDialog(
//          title: Text("Add New",style: TextStyle(decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.double,decorationThickness: 2,letterSpacing: 2)),
//          actions: <Widget>[Container(
//            width: 300,
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Row(
//                  children: [
//                    Container(
//                        width: 120,
//                        padding: const EdgeInsets.only(left: 10),
//                        child: Text(
//                          "Product Name:",
//                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
//                        )),
//                    Expanded(
//                      child: TextFormField(
//                        // The validator receives the text that the user has entered.
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return 'Please enter some text';
//                          }
//                          return null;
//                        },
//                        onSaved: (String value) {
//                          setState(() {
//                            formPopUpData['name'] = value;
//                          });
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//                Container(
//                    margin: const EdgeInsets.only(top: 20),
//                    padding: const EdgeInsets.only(left: 10),
//                    alignment: Alignment.centerLeft,
//                    width: 100,
//                    child: Text(
//                      "Image:",
//                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                    )),
//                Preferences(this),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Container(
//                      padding: const EdgeInsets.fromLTRB(10, 5, 0 ,10),
//                      child: new RaisedButton(onPressed: (){
//                        _formK.currentState.save();
//                        handlePopUpAPICall(context, formPopUpData);
//                        Navigator.of(context).pop();
//
//                      }, child: new Text("Save"),
//                        color: Colors.black26,
//                        textColor: Colors.white,
//                      ),
//                    ),
//                    Container(
//                      padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
//                      child: new RaisedButton(
//                        color: Colors.black26,
//                        textColor: Colors.white,
//                        child: new Text("Close"),
//                        onPressed: () {
//                          Navigator.of(context).pop();
//                        },
//                      ),
//                    ),
//                  ],
//                ),],
//            ),
//          )],
//        )
//    );

//    void _showDialog() {
//      formPopUpData["productType"] = formData["productType"];
//      showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return popUpWidget;
//          });
//    }

    Widget FormWidget = Container();
    if (formData["productType"] == "plywood" ||
        formData["productType"] == "waterproof") {
      FormWidget = Column(children: [
        Row(
          children: [
            Container(
                width: 70,
                child: Text(
                  "Thickness:",
                  style: TextStyle(color: Color(0xffaf8eb5)),
                )),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: formData["name"],
                icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xffaf8eb5)),
                underline: Container(
                  height: 2,
                  color: Color(0xFFe1bee7),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    formData["name"] = newValue;
                  });
                },
                items:
                    plyThickness.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
                width: 70,
                child: Text(
                  "Size:",
                  style: TextStyle(color: Color(0xffaf8eb5)),
                )),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: formData["size"],
                icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xffaf8eb5)),
                underline: Container(
                  height: 2,
                  color: Color(0xFFe1bee7),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    formData["size"] = newValue;
                  });
                },
                items: plySize.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ]);
    } else if (formData["productType"] == "beet") {
      FormWidget = Column(children: [
        Row(
          children: [
            Container(
                width: 70,
                child: Text(
                  "Name:",
                  style: TextStyle(color: Color(0xffaf8eb5)),
                )),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: formData['name'],
                icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xffaf8eb5)),
                underline: Container(
                  height: 2,
                  color: Color(0xFFe1bee7),
                ),
                onChanged: (String newValue) {
                  setState(() {
//                    if (newValue == "Add New") {
//                      _showDialog();
//                    } else {
//                      formData["name"] = newValue;
//                    }
                     formData["name"] = newValue;

                  });
                },
                items: beetName.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
                width: 70,
                child: Text(
                  "Size:",
                  style: TextStyle(color: Color(0xffaf8eb5)),
                )),
            Expanded(
              child: DropdownButton<String>(
                isExpanded: true,
                value: formData['size'],
                icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xffaf8eb5)),
                underline: Container(
                  height: 2,
                  color: Color(0xFFe1bee7),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    formData["size"] = newValue;
                  });
                },
                items: beetSize.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ]);
    } else if (formData["productType"] == "others") {
      FormWidget = Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                  width: 70,
                  child: Text(
                    "Name:",
                    style: TextStyle(color: Color(0xffaf8eb5)),
                  )),
              Expanded(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: formData['name'],
                  icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Color(0xffaf8eb5)),
                  underline: Container(
                    height: 2,
                    color: Color(0xFFe1bee7),
                  ),
                  onChanged: (String newValue) {
                    setState(() {
//                      if (newValue == "Add New") {
//                        _showDialog();
//                      } else {
//                        formData["name"] = newValue;
//                      }
                      formData["name"] = newValue;

                    });
                  },
                  items:
                      othersName.map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  width: 70,
                  child: Text("Size:",
                      style: TextStyle(color: Color(0xffaf8eb5)))),
              Expanded(
                child: TextFormField(
                  initialValue: formData["size"],
                  style: TextStyle(color: Color(0xffaf8eb5)),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    formData['size'] = value;
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductCategory(
                  widget.initialValues["productType"],
                  widget.initialValues["title"])),
        )?? true;
      },
      child: Scaffold(

        body: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
//                  DropdownButton<String>(
//                    isExpanded: true,
//                    value: formData["productType"],
//                    icon: Icon(Icons.arrow_drop_down),
//                    iconSize: 24,
//                    elevation: 16,
//                    style: TextStyle(color: Color(0xffaf8eb5)),
//                    underline: Container(
//                      height: 2,
//                      color: Color(0xFFe1bee7),
//                    ),
//                    onChanged: (String newValue) {
//                      setState(() {
//                        formData["productType"] = newValue;
//                      });
//                    },
//                    items:
//                    productType.map<DropdownMenuItem<String>>((dynamic value) {
//                      return DropdownMenuItem<String>(
//                        value: value,
//                        child: Text(value),
//                      );
//                    }).toList(),
//                  ),
                    FormWidget,
                    Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Text(
                              "Quantity:",
                              style: TextStyle(color: Color(0xffaf8eb5)),
                            )),
                        Expanded(
                          child: TextFormField(
                            initialValue: formData["quantity"].toString(),
                            style: TextStyle(color: Color(0xffaf8eb5)),
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
                              formData['quantity'] = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 70,
                            child: Text("Price:",
                                style: TextStyle(color: Color(0xffaf8eb5)))),
                        Expanded(
                          child: TextFormField(
                            initialValue: formData["price"].toString(),
                            style: TextStyle(color: Color(0xffaf8eb5)),
                            keyboardType: TextInputType.number,

                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              formData['price'] = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 70,
                            child: Text(
                              "Godown:",
                              style: TextStyle(color: Color(0xffaf8eb5)),
                            )),
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: formData['godown'],
                            icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5)),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Color(0xffaf8eb5)),
                            underline: Container(
                              height: 2,
                              color: Color(0xFFe1bee7),
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                formData["godown"] = newValue;
                              });
                            },
                            items: goDown
                                .map<DropdownMenuItem<String>>((dynamic value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            _formKey.currentState.save(); //onSaved is called!
//                          print(formData);

                            if (formData["productType"] == "PlyWood" ||
                                formData["productType"] == "WaterProof") {
                              handleAPICall(context, formData);
                            } else if (formData["productType"] == "Beet") {
                              handleAPICall(context, formData);
                            } else {
                              handleAPICall(context, formData);
                            }
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void handleAPICall(context, jsonDataAll) async {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('Editing...'),
  ));

  try {
    if (jsonDataAll["productType"] == "plywood" ||
        jsonDataAll["productType"] == "waterproof") {
      final PlyWood _plyWood = new PlyWood();
      _plyWood.godown = jsonDataAll["godown"];
      _plyWood.name = jsonDataAll["name"];
      _plyWood.size = jsonDataAll["size"];
      _plyWood.quantity = int.parse(jsonDataAll["quantity"]);
      _plyWood.price = double.parse(jsonDataAll["price"]);
      _plyWood.id = jsonDataAll["id"];
      if (jsonDataAll["productType"] == "plywood") {
        await _plyWood.saveEditPly();
      } else if (jsonDataAll["productType"] == "waterproof") {
        await _plyWood.saveEditWaterProof();
      }

      if (_plyWood.sentToServer == true) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
          'Edited successfully!',
        )));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Editing failed!')));
      }
    } else if (jsonDataAll["productType"] == "beet") {
      final Beet _beet = new Beet();
      _beet.godown = jsonDataAll["godown"];
      _beet.name = jsonDataAll["name"];
      _beet.size = jsonDataAll["size"];
      _beet.quantity = int.parse(jsonDataAll["quantity"]);
      _beet.price = double.parse(jsonDataAll["price"]);
      _beet.id = jsonDataAll["id"];
      await _beet.saveEdit();

      if (_beet.sentToServer == true) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
          'Edited successfully!',
        )));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Editing failed!')));
      }
    } else if (jsonDataAll["productType"] == "others") {
      final Others _others = new Others();
      _others.godown = jsonDataAll["godown"];
      _others.name = jsonDataAll["name"];
      _others.size = jsonDataAll["size"];
      _others.quantity = int.parse(jsonDataAll["quantity"]);
      _others.price = double.parse(jsonDataAll["price"]);
      _others.id = jsonDataAll["id"];

      await _others.saveEdit();

      if (_others.sentToServer == true) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
          'Edited successfully!',
        )));
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Editing failed!')));
      }
    }
  } catch (e) {
    print(e);
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Sending failed!')));
  }
}

//void handlePopUpAPICall(context, data) async {
//  Scaffold.of(context).showSnackBar(SnackBar(
//    content: Text('Processing...'),
//  ));
//  if (data["productType"] == "beet") {
//    final BeetName _beetname = new BeetName();
//    _beetname.name = data["name"];
//    _beetname.image = data["image"];
//
//    await _beetname.save();
//
//    if (_beetname.sentToServer == true) {
//      Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text(
//        'Sent successfully!',
//      )));
//    } else {
//      Scaffold.of(context)
//          .showSnackBar(SnackBar(content: Text('Sending failed!')));
//    }
//  } else if (data["productType"] == "others") {
//    final OthersName _othersname = new OthersName();
//    _othersname.name = data["name"];
//    _othersname.image = data["image"];
//
//    await _othersname.save();
//
//    if (_othersname.sentToServer == true) {
//      Scaffold.of(context).showSnackBar(SnackBar(
//          content: Text(
//        'Sent successfully!',
//      )));
//    } else {
//      Scaffold.of(context)
//          .showSnackBar(SnackBar(content: Text('Sending failed!')));
//    }
//  }
//}
