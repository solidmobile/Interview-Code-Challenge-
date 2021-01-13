import 'package:code_test_chat_app/helper/textstyle.dart';
import 'package:code_test_chat_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen();

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': MessagesScreen(),
        'title': 'Friends',
      },
      {
        'page': ProfileScreen(),
        'title': 'Profile',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'], style: boldTextStyle(size: 21)),
        backgroundColor: appStore.appBarColor,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: appStore.appBarColor,
        unselectedItemColor: appStore.iconColor,
        selectedItemColor: appStore.iconSecondaryColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.mobile_friendly),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.list_alt),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
