import 'package:flutter/material.dart';
import 'package:inventoryapp/add_item/api_request/fetch_form_details.dart';
import 'package:inventoryapp/add_item/screen/add_item_main.dart';
import 'package:inventoryapp/plywood/model/product_model.dart';

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD PRODUCT"),
      ),
      body: FutureBuilder(
        future: fetchFormDetails(),
        builder: (context,snapshot){
          if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
          return snapshot.hasData
              ? AddProductTypeForm(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
