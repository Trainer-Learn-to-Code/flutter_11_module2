import 'package:flutter/material.dart';

/*
* The Bottom Navigation Bar is a common user interface element in mobile
* applications that allows users to quickly switch between different views or
*  sections of an app. In Flutter, the BottomNavigationBar widget provides
*  a built-in implementation of this user interface element.
* In this example, we create a BottomNavigationBarExample widget
*  that includes a Scaffold with an AppBar, a Center widget, and a
*  BottomNavigationBar. The BottomNavigationBar includes three
* BottomNavigationBarItem objects, each with an icon and a label.

When the user taps one of the BottomNavigationBarItem objects,
*  the _onItemTapped method is called, which updates the _selectedIndex
* property to the selected index. The Center widget then displays
* the corresponding widget from the _widgetOptions list.*/
class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
