
import 'dart:convert';
import 'package:inventoryapp/plywood/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/config.dart';

Future<List<Thickness>> fetchThickness() async {

  var url = serverRef+'inventory/plythickness/';
  final response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData.map<Thickness>((json) => Thickness.fromJson(json))
          .toList();
    }
    else {
      print("Failed");
      throw Exception('Failed to load thickness');
    }
  }
  catch(e)
  {
    print(e);
    throw Exception('Failed to load thickness');
  }
}
Future<List<DisplayPlyWood>> fetchPlywoodDetails(String productType,String name) async{
  var url;
  if(productType=="plywood"|| productType =="waterproof")
    {
      url = serverRef +'inventory/'+productType+'/?thickness=' + name;
    }
  else
    {
      url = serverRef +'inventory/'+productType+'/?name=' + name;
    }

  final response = await http.get(url);
  try{
    if(response.statusCode==200)
    {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map<DisplayPlyWood>((json)=>DisplayPlyWood.fromJson(json)).toList();
    }
    else
      {
        throw Exception("Failed to load Plywood");
      }
  }
  catch(e)
  {
    print(e);
  }

}

