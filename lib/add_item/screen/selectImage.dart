

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Preferences extends StatefulWidget {

  final ref;
  Preferences(this.ref);
  @override
  _PreferencesState createState() => _PreferencesState();
}


class _PreferencesState extends State<Preferences> with TickerProviderStateMixin {


  File _image;

  getImage(bool isCamera) async {
    File image;

    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = image;
      widget.ref.formPopUpData['imageSelected'] = true;
      widget.ref.formPopUpData['image']=base64Encode(image.readAsBytesSync());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 5,left: 12),
              child: FlatButton(
                color: Colors.black12,
                textColor: Colors.black54,
                child: Text('Use Camera'),
                onPressed: () {
                  getImage(true);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, right: 5),
              child: FlatButton(
                color: Colors.black12,
                textColor: Colors.black54,
                child: Text('Import From Gallery'),
                onPressed: () {
                  getImage(false);
                },
              ),
            ),
          ],
        ),

    _image == null
    ? Container():Text("Image Selected")
//        : Image.file(
//    _image,
//    height: 155,
//    width: 155,
//    ),
    ]
    );
  }
  }

