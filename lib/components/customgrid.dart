import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventoryapp/beet/screen/beet_main.dart';
import 'package:inventoryapp/components/option_popup.dart';
import 'package:inventoryapp/others/model/delete_type_model.dart';
import 'package:inventoryapp/product_category/screen/product_category_main.dart';
import 'package:inventoryapp/components/card.dart';


class CustomGrid extends StatelessWidget {
  CustomGrid(this.data,this.productType);
  final data;
  final String productType;
  final GlobalKey _menuKey = new GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void _showPopupMenu(Offset offset,String productName) async {
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
                  handleDeleteCall(context,productType,productName);
                  Navigator.of(context).pop();
                },
              ),
            ),

        ],
        elevation: 8.0,
      );
    }
    return Scaffold(
        body:
                GridView.count(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(data.length, (index) {
                    return GestureDetector(
                        child: CustomCard(
                            data[index].productName,
                            data[index].imageUrl),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductCategory(productType, data[index].productName)
                            ),
                          );
                        },
                        onLongPressEnd: (LongPressEndDetails details){
                          if(productType=="others"||productType=="beet") {
                            _showPopupMenu(details.globalPosition,
                                data[index].productName);
                          }
                    },);
                  }),
                )


    );
  }
}


void handleDeleteCall (context,String pType, String name) async
{
  Scaffold.of(context)
      .showSnackBar(
      SnackBar(
        content: Text('Deleting...'),
      ));

  try {
    final DeleteType _dType = new DeleteType();
    _dType.name = name;
    _dType.pType = pType;

    await _dType.delete();

    if (_dType.sentToServer == true) {

      Scaffold.of(context)
          .showSnackBar(
          SnackBar(
              content: Text('Deleted successfully!',
              )));
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
