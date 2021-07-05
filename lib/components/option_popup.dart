import 'package:flutter/material.dart';
import 'package:inventoryapp/product_category/screen/product_category_main.dart';

import 'card.dart';
class PopupOption extends StatefulWidget {
  var data;
  PopupOption(this.data);
  @override
  _PopupOptionState createState() => _PopupOptionState();
}

class _PopupOptionState extends State<PopupOption> {
  final GlobalKey _menuKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final button = new PopupMenuButton(
        key: _menuKey,
        itemBuilder: (_)=><PopupMenuItem<String>>[
      new PopupMenuItem(child: const Text('Delete'),value: 'Delete',),
    ],
      onSelected: (_){});
    final tile =
        new ListTile(title:new Text("DELETE THE SELECTED ITEM"),
        trailing: button,onTap: (){
          dynamic state = _menuKey.currentState;
          state.showButtonMenu();
          },);
    return tile;
  }
}
