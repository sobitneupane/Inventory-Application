

import 'package:flutter/material.dart';
import 'package:inventoryapp/components/customgrid.dart';
import 'package:inventoryapp/plywood/api_request/product_fetch.dart';
import 'package:inventoryapp/plywood/model/product_model.dart';
import 'package:inventoryapp/waterproof/api_request/waterproof_fetch.dart';

class WaterProofMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      child: FutureBuilder<List<Thickness>>(
        future: fetchThickness(),
        builder: (context,snapshot){
          if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
          return snapshot.hasData
              ? CustomGrid(snapshot.data,"waterproof")
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
