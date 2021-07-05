import 'package:flutter/material.dart';
import 'package:inventoryapp/details/screen/details_main.dart';
import 'package:inventoryapp/plywood/api_request/product_fetch.dart';
import 'package:inventoryapp/plywood/model/product_model.dart';

class ProductCategory extends StatelessWidget {
  ProductCategory(this.productType,this.title);
  final String title;
  final String productType;
  @override
  Widget build(BuildContext context) {
    String titleAddOn = "";
    if(productType == "plywood")
      {
        titleAddOn = "PLYWOOD: ";
      }
    else if(productType == "waterproof")
      {
        titleAddOn = "WATERPROOF: ";
      }
    else if (productType == "beet")
      {
        titleAddOn = "BEET: ";
      }
    return Scaffold(
        appBar: AppBar(
          title: Text(titleAddOn +title),
        ),

        body:Container(
          child: FutureBuilder<List<DisplayPlyWood>>(
            future: fetchPlywoodDetails(productType,title),
            builder: (context,snapshot){
              if (snapshot.hasError) return Center(child: Text("NO INTERNET CONNECTION"),);
              return snapshot.hasData
                  ? DetailsMain(productType,snapshot.data,title)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        )
    );
  }
}
