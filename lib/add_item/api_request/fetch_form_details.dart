
import 'dart:convert';
import 'package:inventoryapp/plywood/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/config.dart';

 Future fetchFormDetails() async {

  var url = serverRef+'inventory/formdetails';
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    }
    else {
      throw Exception('Failed to load Form Details');
    }
  }
  catch(e)
  {
    throw Exception("Failed to load Form Details ");
  }
}