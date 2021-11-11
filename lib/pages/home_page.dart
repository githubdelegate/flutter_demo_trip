import 'package:flutter/material.dart';
import 'package:new_fl/dao/home_dao.dart';
import 'package:new_fl/pages/home_category_page.dart';
import 'package:new_fl/util/color.dart';
import 'package:new_fl/widget/top_navigator_bar.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key? key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  final List _tabs = ['推荐', '热门', '动画', '游戏', '科技', '知识', '运动'];
  // late TabController _tabController;

  @override
  void initState() {
    super.initState();

    HomeDao.get();
    // _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            TopNavigationBar(child: _appBar()),
            Container(
              child: _tabBar(),
              color: Colors.white,
            ),
            Flexible(
              child: TabBarView(
                  // controller: _tabController,
                  children:
                      _tabs.map((e) => const HomeCategoryPageRoute()).toList()),
            ),
            Image.asset(
              'images/avatar.png',
              width: 50,
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       TopNavigationBar(child: _appBar()),
    //       Container(
    //         child: _tabBar(),
    //         color: Colors.white,
    //       ),
    //       Flexible(
    //         child: TabBarView(
    //             controller: _tabController,
    //             children: _tabs.map((e) => HomeCategoryPageRoute()).toList()),
    //       ),
    //       Image.asset(
    //         'images/avatar.png',
    //         width: 50,
    //       )
    //     ],
    //   ),
    // );
  }

  // 分类tab
  TabBar _tabBar() {
    return TabBar(
      // controller: _tabController,
      isScrollable: true,
      labelColor: Colors.black,
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: primaryCor, width: 2),
          insets: EdgeInsets.only(left: 15, right: 15)),
      tabs: _tabs
          .map((e) => Tab(
                  child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  e,
                  style: const TextStyle(fontSize: 16),
                ),
              )))
          .toList(),
    );
  }

// 导航条
  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              print('tap avatar');
            },
            child: ClipOval(
                child: Image.asset('images/avatar.png', width: 46, height: 46)),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(23),
          //   child: Image.asset('images/avatar.png', width: 46, height: 46),
          // ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                height: 32,
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.search,
                  color: defalutCor,
                ),
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
            ),
          )),
          const Icon(
            Icons.explore_outlined,
            color: defalutCor,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Icon(
              Icons.email,
              color: defalutCor,
            ),
          )
        ],
      ),
    );
  }
}
