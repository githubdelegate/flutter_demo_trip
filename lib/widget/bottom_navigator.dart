import 'package:flutter/material.dart';
import 'package:new_fl/pages/favorite_page.dart';
import 'package:new_fl/pages/home_page.dart';
import 'package:new_fl/pages/mine_page.dart';
import 'package:new_fl/pages/rank_page.dart';
import 'package:new_fl/util/color.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final PageController _pageController = PageController();
  int _pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomePageRoute(),
          RankPageRoute(),
          FavoritePageRoute(),
          MinePageRoute()
        ],
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomBarItem('Home', Icons.home),
          _bottomBarItem('Rank', Icons.local_fire_department),
          _bottomBarItem('Favorite', Icons.favorite),
          _bottomBarItem('Mine', Icons.live_tv)
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIdx,
        selectedItemColor: primaryCor,
        onTap: (int idx) {
          _pageController.jumpToPage(idx);
          setState(() {
            _pageIdx = idx;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItem(String title, IconData icon) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: defalutCor),
        activeIcon: Icon(icon, color: primaryCor),
        label: title);
  }
}
