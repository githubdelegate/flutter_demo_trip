import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/my_page.dart';
import 'package:flutter_demo/pages/search_page.dart';
import 'package:flutter_demo/pages/travel_page.dart';

class TabNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigationState();
}

class _TabNavigationState extends State {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  final PageController _controller = PageController();
  int _crtIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          _controller.jumpToPage(idx);
          setState(() {
            _crtIdx = idx;
          });
        },
        currentIndex: _crtIdx,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor),
              activeIcon: Icon(Icons.home, color: _activeColor),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor),
              activeIcon: Icon(Icons.search, color: _activeColor),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.face, color: _defaultColor),
              activeIcon: Icon(Icons.face, color: _activeColor),
              label: 'Travel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: _defaultColor),
              activeIcon: Icon(Icons.message, color: _activeColor),
              label: 'My')
        ],
      ),
    );
  }
}
