import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventoryapp/add_item/model/beet_model.dart';
import 'package:inventoryapp/add_item/model/beet_name_model.dart';
import 'package:inventoryapp/add_item/model/others.dart';
import 'package:inventoryapp/add_item/model/others_name_model.dart';
import 'package:inventoryapp/add_item/model/plywood_model.dart';
import 'package:inventoryapp/add_item/screen/add_item.dart';

void handleAPICall (context,jsonDataAll,jsonDataSpecific) async
{
  Scaffold.of(context)
      .showSnackBar(
      SnackBar(
        content: Text('Processing...'),
      ));

  try {
    if (jsonDataAll["productType"] == "PlyWood" || jsonDataAll["productType"] == "WaterProof") {
      final PlyWood _plyWood = new PlyWood();
      _plyWood.godown = jsonDataAll["godown"];
      _plyWood.name = jsonDataSpecific["name"];
      _plyWood.size = jsonDataSpecific["size"];
      _plyWood.quantity = int.parse(jsonDataAll["quantity"]);
      _plyWood.price = double.parse(jsonDataAll["price"]);

      if(jsonDataAll["productType"] == "PlyWood")
        {
          await _plyWood.savePly();
        } else if(jsonDataAll["productType"] == "WaterProof")
      {
        await _plyWood.saveWaterProof();
      }

      if (_plyWood.sentToServer == true) {
        Scaffold.of(context)
            .showSnackBar(
            SnackBar(
                content: Text('Sent successfully!',
                )));
      }
      else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Sending failed!')));
      }
    }
    else if (jsonDataAll["productType"] == "Beet") {
      final Beet _beet = new Beet();
      _beet.godown = jsonDataAll["godown"];
      _beet.name = jsonDataSpecific["name"];
      _beet.size = jsonDataSpecific["size"];
      _beet.quantity = int.parse(jsonDataAll["quantity"]);
      _beet.price = double.parse(jsonDataAll["price"]);
      await _beet.save();

      if (_beet.sentToServer == true) {
        Scaffold.of(context)
            .showSnackBar(
            SnackBar(
                content: Text('Sent successfully!',
                )));
      }
      else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Sending failed!')));
      }
    } else if(jsonDataAll["productType"] == "Others")
      {
        final Others _others = new Others();
        _others.godown = jsonDataAll["godown"];
        _others.name = jsonDataSpecific["name"];
        _others.size = jsonDataSpecific["size"];
        _others.quantity = int.parse(jsonDataAll["quantity"]);
        _others.price = double.parse(jsonDataAll["price"]);

        await _others.save();

        if (_others.sentToServer == true) {
          Scaffold.of(context)
              .showSnackBar(
              SnackBar(
                  content: Text('Sent successfully!',
                  )));
        }
        else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Sending failed!')));
        }
      }
  }
  catch(e) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Sending failed!')));
  }
}

void handlePopUpAPICall(context,data) async
{
  print(data);
  Scaffold.of(context)
      .showSnackBar(
      SnackBar(
        content: Text('Processing...'),
      ));
  if(data["productType"]=="Beet")
    {
      final BeetName _beetname = new BeetName();
      _beetname.name = data["name"];
      _beetname.image = data["image"];

      await _beetname.save();

      if (_beetname.sentToServer == true) {

        Scaffold.of(context)
            .showSnackBar(
            SnackBar(
                content: Text('Sent successfully!',
                )));
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=> AddItem(),
            )
        );
      }
      else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Sending failed!')));
      }
    } else if(data["productType"]=="Others")
      {
        final OthersName _othersname = new OthersName();
        _othersname.name = data["name"];
        _othersname.image = data["image"];

        await _othersname.save();

        if (_othersname.sentToServer == true) {

          Scaffold.of(context)
              .showSnackBar(
              SnackBar(
                  content: Text('Sent successfully!',
                  )));
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> AddItem(),
              )
          );
        }
        else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Sending failed!')));
        }
      }
}