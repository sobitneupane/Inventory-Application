
import 'package:inventoryapp/add_item/api_request/get_product.dart';
import 'package:inventoryapp/config.dart';
import 'package:inventoryapp/details/api_request/delete_details.dart';

class PlyWood {
  int id;
  String name;
  String size;
  int quantity;
  double price;
  String godown;
  String sentStatus;
  bool sentToServer;

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["size"] = size;
    map["quantity"] = quantity;
    map["price"] = price;
    map["godown"] = godown;
    map["id"] = id;
    return map;
  }

  String toString(){
    var params = "thickness=${Uri.encodeComponent(name)}&size=${Uri.encodeComponent(size)}+&quantity=${Uri.encodeComponent(quantity.toString())}&price=${Uri.encodeComponent(price.toString())}&godown=$godown";
    return params;
  }

  savePly() async{
    var url = serverRef+"inventory/addplywood?" + this.toString();
    await sendToServerPly(this,url);
  }
  saveWaterProof() async{
    var url = serverRef+"inventory/addwaterproof?" + this.toString();
    await sendToServerPly(this,url);
  }
  saveEditPly() async{
    this.sentToServer=await updateDetails("plywood", this.id, "edit", this);
  }
  saveEditWaterProof() async{
    this.sentToServer=await updateDetails("waterproof", this.id, "edit", this);
  }
}