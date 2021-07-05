
import 'package:inventoryapp/add_item/api_request/get_product.dart';
import 'package:inventoryapp/others/api_request/delete_type.dart';


class DeleteType {
  String name;
  String pType;
  String sentStatus;
  bool sentToServer;

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["pType"] = pType;
    return map;
  }


  delete() async {
    await deleteType(this);
  }
}