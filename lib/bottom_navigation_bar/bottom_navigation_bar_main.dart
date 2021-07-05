import 'package:flutter/material.dart';
import 'package:inventoryapp/beet/screen/beet_main.dart';
import 'package:inventoryapp/others/screen/others_main.dart';
import 'package:inventoryapp/plywood/screen/plywood_main.dart';
import 'package:inventoryapp/waterproof/screen/waterproof_main.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PlywoodMain(),
    BeetMain(),
    WaterProofMain(),
    OthersMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_none),
            title: Text('PlyWood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            title: Text('Beet'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            title: Text('WaterProof'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.trip_origin),
            title: Text("Others")
          )
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xffaf8eb5),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
