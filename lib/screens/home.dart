import 'package:finaro_project/screens/dashboard/dashboard.dart';
import 'package:finaro_project/screens/fintime/fintime.dart';
import 'package:finaro_project/screens/fintips/fintips.dart';
import 'package:finaro_project/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    FinTimePage(),
    FinTipsPage(),
    ProfilePage()
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
            icon: Icon(Icons.home_outlined, color: Colors.black),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_off_outlined, color: Colors.black),
            label: '',
            activeIcon: Icon(Icons.location_off, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined, color: Colors.black),
            label: '',
            activeIcon: Icon(Icons.groups, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined, color: Colors.black),
            label: '',
            activeIcon: Icon(Icons.person, color: Colors.blue),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
