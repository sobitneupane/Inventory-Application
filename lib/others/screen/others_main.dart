

import 'package:flutter/material.dart';
import 'package:inventoryapp/components/customgrid.dart';
import 'package:inventoryapp/others/api_request/other_product_fetch.dart';
import 'package:inventoryapp/others/model/other_product_model.dart';

class OthersMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      child: FutureBuilder<List<OtherProducts>>(
        future: fetchOtherProduct(),
        builder: (context,snapshot){
          if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
          return snapshot.hasData
              ? CustomGrid(snapshot.data,"others")
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
