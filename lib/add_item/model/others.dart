
import 'package:inventoryapp/add_item/api_request/get_product.dart';
import 'package:inventoryapp/config.dart';
import 'package:inventoryapp/details/api_request/delete_details.dart';

class Others {
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
    var params = "name=$name&size=$size+&quantity=$quantity&price=$price&godown=$godown";
    return params;
  }

  save() async{
    await sendToServerOthers(this);
  }

  saveEdit() async{
    this.sentToServer=await updateDetails("others", this.id, "edit", this);
  }
}