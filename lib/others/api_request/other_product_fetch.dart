
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inventoryapp/others/model/other_product_model.dart';

import 'package:inventoryapp/config.dart';

Future<List<OtherProducts>> fetchOtherProduct() async {
  var url = serverRef+'inventory/othersname/';
  final response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map<OtherProducts>((json) => OtherProducts.fromJson(json))
          .toList();
    }
    else {
      throw Exception('Failed to load thickness');
    }
  }
  catch(e)
  {
    print(e);
  }
//  var jsonString = '[{"id":1,"productName":"Door","image":"images/door.jpg"},{"id":2,"productName":"Kabja","image":"images/kabja.jpg"}]';
//  var jsonData = jsonDecode(jsonString);
//  return jsonData.map<OtherProducts>((json)=>OtherProducts.fromJson(json)).toList();

}