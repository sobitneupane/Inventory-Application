import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventoryapp/add_item/screen/add_item.dart';
import 'package:inventoryapp/add_item/screen/handle_api_call.dart';
import 'package:inventoryapp/add_item/screen/selectImage.dart';

class AddProductTypeForm extends StatefulWidget {
  final data;
  AddProductTypeForm(this.data);
  @override
  _AddProductTypeFormState createState() => _AddProductTypeFormState();
}

class _AddProductTypeFormState extends State<AddProductTypeForm> {
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
  static Map<String, dynamic> formDataPly;
  static Map<String, dynamic> formDataBeet;
  static Map<String, dynamic> formDataOthers;
  final Map<String,dynamic>  formPopUpData = {
    'productType': null,
    'name':null,
    'image':null,
    'imageSelected':false
  };

  @override
  void didChangeDependencies() {
    print("dependency");
    super.didChangeDependencies();
    productType = widget.data["productName"];
    plyThickness = widget.data["plyThickness"];
    plySize = widget.data["plySize"];
    beetName = widget.data["beetName"];
    beetName.add("Add New");
    othersName = widget.data["othersName"];
    othersName.add("Add New");
    beetSize = widget.data["beetSize"];
    goDown = widget.data["godown"];
    formData = {
      'productType': productType[0],
      'quantity': null,
      'price': null,
      'godown': goDown[0]
    };
    formDataPly = {
      'name': plyThickness[0],
      'size': plySize[0]
    };
    formDataBeet = {
      'name': beetName[0],
      'size': beetSize[0]
    };
    formDataOthers = {
      'name': othersName[0],
      'size': null
    };
}

  @override
  Widget build(BuildContext context) {


    Widget popUpWidget = Form(
      key: _formK,
    child:AlertDialog(
          title: Text("Add New",style: TextStyle(decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.double,decorationThickness: 2,letterSpacing: 2)),
          actions: <Widget>[Container(
            width: 264,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        width: 120,
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Product Name:",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),
                        )),
                    Expanded(
                      child: TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          setState(() {
                            formPopUpData['name'] = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    width: 100,
                    child: Text(
                      "Image:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                Preferences(this),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0 ,0),
                      child: new RaisedButton(onPressed: (){
                        _formK.currentState.save();
                        handlePopUpAPICall(context, formPopUpData);
                        Navigator.of(context).pop();

                      }, child: new Text("Save"),
                        color: Colors.black26,
                        textColor: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                      child: new RaisedButton(
                        color: Colors.black26,
                        textColor: Colors.white,
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),],
            ),
          )],
        )
    );


    void _showDialog(){
      formPopUpData["productType"] = formData["productType"];
      showDialog(
          context: context,
          builder: (BuildContext context){
              return popUpWidget;
          }
      );
    }


    Widget plyFormWidget = Column(children: [
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
              value: formDataPly["name"],
              icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color(0xffaf8eb5)),
              underline: Container(
                height: 2,
                color: Color(0xFFe1bee7),
              ),
              onChanged: (String newValue) {
                setState(() {
                  formDataPly["name"] = newValue;
                });
              },
              items: plyThickness.map<DropdownMenuItem<String>>((dynamic value) {
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
              value: formDataPly["size"],
              icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color(0xffaf8eb5)),
              underline: Container(
                height: 2,
                color: Color(0xFFe1bee7),
              ),
              onChanged: (String newValue) {
                setState(() {
                  formDataPly["size"] = newValue;
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

    Widget beetFormWidget = Column(children: [
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
              value: formDataBeet['name'],
              icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color(0xffaf8eb5)),
              underline: Container(
                height: 2,
                color: Color(0xFFe1bee7),
              ),
              onChanged: (String newValue) {
                setState(() {
                  if(newValue == "Add New")
                    {
                      _showDialog();
                    }
                  else {
                    formDataBeet["name"] = newValue;
                  }
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
              value: formDataBeet['size'],
              icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color(0xffaf8eb5)),
              underline: Container(
                height: 2,
                color: Color(0xFFe1bee7),
              ),
              onChanged: (String newValue) {
                setState(() {
                  formDataBeet["size"] = newValue;
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

    var othersFormWidget = Column(
      children: <Widget>[ Row(
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
              value: formDataOthers['name'],
              icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color(0xffaf8eb5)),
              underline: Container(
                height: 2,
                color: Color(0xFFe1bee7),
              ),
              onChanged: (String newValue) {
                setState(() {
                  if(newValue == "Add New")
                  {
                    _showDialog();
                  }
                  else {
                    formDataOthers["name"] = newValue;
                  }
                });
              },
              items: othersName.map<DropdownMenuItem<String>>((dynamic value) {
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
                style: TextStyle(color: Color(0xffaf8eb5)),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String value) {
                  formDataOthers['size'] = value;
                },
              ),
            ),
          ],
        ),],
    );

    return Scaffold(

      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    isExpanded: true,
                    value: formData["productType"],
                    icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Color(0xffaf8eb5)),
                    underline: Container(
                      height: 2,
                      color: Color(0xFFe1bee7),
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        formData["productType"] = newValue;
                      });
                    },
                    items:
                        productType.map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  formData["productType"] == "PlyWood" ||
                          formData["productType"] == "WaterProof"
                      ? plyFormWidget
                      : Container(),
                  formData["productType"] == "Beet" ? beetFormWidget : Container(),
                  formData["productType"] == "Others"? othersFormWidget:Container(),
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
                          icon: Icon(Icons.arrow_drop_down,color: Color(0xffaf8eb5),),
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
                          items:
                              goDown.map<DropdownMenuItem<String>>((dynamic value) {
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

                          if(formData["productType"] == "PlyWood" || formData["productType"] == "WaterProof" )
                            {
                              handleAPICall(context,formData,formDataPly);
                            }
                          else if(formData["productType"]=="Beet")
                            {
                              handleAPICall(context, formData,formDataBeet);
                            }
                          else
                            {
                              handleAPICall(context,formData,formDataOthers);
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
    );
  }
}

