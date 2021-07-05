import 'package:flutter/cupertino.dart';
import 'package:inventoryapp/add_item/api_request/get_product.dart';

class OthersName{
  String name;
  String image;
  String sentStatus;
  bool sentToServer;

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["image"] = image;
    return map;
  }
  String toString(){
    var params = "name=$name&image=$image";
    return params;
  }

  save() async {
    await sendToServerOthersName(this);
  }

}