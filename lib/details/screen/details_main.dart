import 'package:flutter/material.dart';
import 'package:inventoryapp/components/detail_card.dart';
import 'package:inventoryapp/details/api_request/delete_details.dart';
import 'package:inventoryapp/product_category/screen/product_category_main.dart';
import 'package:inventoryapp/components/card.dart';


class DetailsMain extends StatelessWidget {
  DetailsMain(this.productType,this.data,this.title);
  final data;
  final productType;
  final title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    void _showPopupMenu(Offset offset,int productName,String thickness) async {
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy, 1000, 1000),
        items: [
          PopupMenuItem(
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                alignment: Alignment.center,
                child:Text("Delete",textAlign: TextAlign.center,),
              ),
              onTap: (){
                handleDeleteDetailsCall(context, productType, productName,title);
                Navigator.pop(context);
              },
            ),
          ),

        ],
        elevation: 8.0,
      );
    }


    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 16,bottom: 16),
          physics: const ScrollPhysics(),
          // Generate 100 widgets that display their index in the List.
          children: List.generate(data.length, (index) { //
            return GestureDetector(
              child: CustomDetailCard(
                  productType,
                  data[index].id,
                  data[index].thickness,
                  data[index].size,
                  data[index].quantity,
                  data[index].price.toString(),
                  data[index].godown,
                  title
              ),
              onLongPressEnd: (LongPressEndDetails details){
                _showPopupMenu(details.globalPosition,data[index].id,data[index].thickness);
              },
            );
          }),
        )


    );
  }
}

void handleDeleteDetailsCall (context,String pType, int id, String title) async
{
  Scaffold.of(context)
      .showSnackBar(
      SnackBar(
        content: Text('Deleting...'),
      ));

  try {

    var sentToServer= await deleteDetails(pType, id);

    if (sentToServer == true) {
      Scaffold.of(context)
          .showSnackBar(
          SnackBar(
              content: Text('Deleted successfully!',
              )));
      Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ProductCategory(pType,title)
    ));
    }
    else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Deleting failed!')));
    }
  }
  catch(e){
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Deleting failed!')));
  }
}
