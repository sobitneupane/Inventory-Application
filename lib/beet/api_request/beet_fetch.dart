
import 'dart:convert';
import 'package:inventoryapp/beet/model/beet_model.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/config.dart';

Future<List<Beets>> fetchBeets() async {

  var url = serverRef+'inventory/beetname/';
  final response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map<Beets>((json) => Beets.fromJson(json))
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
}