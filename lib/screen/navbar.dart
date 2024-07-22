import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perpus_mobile/screen/borrow_list.dart';
import 'package:perpus_mobile/screen/homePage.dart';
import 'package:perpus_mobile/screen/library.dart';

import 'package:perpus_mobile/screen/search.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Search(),
    BorrowPage(),
    libraryPage(),
  ];

  void _onItemTap(int index) {
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFDAAA63),
            label: 'Home',
            icon: Icon(Icons.menu_book_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Book Store',
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: 'Library',
            icon: Icon(Icons.stacked_bar_chart),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}