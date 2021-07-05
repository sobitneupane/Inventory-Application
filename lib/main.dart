import "package:flutter/material.dart";
import 'package:inventoryapp/my_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inventory App",
      theme: ThemeData(
          primaryColor: Color(0xffaf8eb5),
          accentColor: Color(0xFFe1bee7),
          cursorColor: Color(0xffaf8eb5)),
      home: MyHome(),
    );
  }
}
