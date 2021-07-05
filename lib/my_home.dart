import 'package:flutter/material.dart';
import 'package:inventoryapp/add_item/screen/add_item.dart';

import 'add_item/screen/add_item_main.dart';
import 'bottom_navigation_bar/bottom_navigation_bar_main.dart';
class MyHome extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    Future<bool> _onWillPop() async {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Tara Traders'),
          content: Text('Are you sure you want to exit?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed:  () async{
                Navigator.of(context).pop(true);
              } ,
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            title: Text("TARA TRADERS"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> AddItem(),
                      )
                  );
                },
              )
            ],),
          body: BottomNavBar()),
    );
  }
}
