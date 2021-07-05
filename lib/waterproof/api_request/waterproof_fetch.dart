
import 'dart:convert';
import 'package:inventoryapp/plywood/model/product_model.dart';
Future<List<Thickness>> fetchWaterproof() async {
  var jsonString = '[{"id":1,"productName":"WaterProofPlyWood1","image":"images/ply.jpg"},{"id":2,"productName":"WaterProofPlyWood2","image":"images/ply.jpg"}]';
  var jsonData = jsonDecode(jsonString);
  return jsonData.map<Thickness>((json)=>Thickness.fromJson(json)).toList();

}