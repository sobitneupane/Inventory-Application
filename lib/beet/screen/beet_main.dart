

import 'package:flutter/material.dart';
import 'package:inventoryapp/beet/api_request/beet_fetch.dart';
import 'package:inventoryapp/beet/model/beet_model.dart';
import 'package:inventoryapp/components/customgrid.dart';

class BeetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      child: FutureBuilder<List<Beets>>(
        future: fetchBeets(),
        builder: (context,snapshot){
          if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
          return snapshot.hasData
              ? CustomGrid(snapshot.data,"beet")
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
