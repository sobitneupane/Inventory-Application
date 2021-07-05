///A widget that is a card with image and name under it.
///Accepts the imageUrl and text to display in the constructor call.

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  String imageUrl;
  CustomCard(this.text, this.imageUrl );
  @override
  Widget build(BuildContext context) {

    final mediaWidth = MediaQuery.of(context).size.width;
    return  Container(
        child: Card(
            margin: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(imageUrl),
                    )
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5),
                  child: RichText(
                      overflow: TextOverflow.ellipsis,
//                        strutStyle: StrutStyle(fontSize: 12.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: text)
                  ),
                ),

              ],
            )));
  }
}
