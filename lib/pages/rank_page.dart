import 'package:flutter/material.dart';
import 'package:new_fl/util/view_util.dart';
import 'package:new_fl/widget/bi_tabbar.dart';
import 'package:new_fl/widget/top_navigator_bar.dart';

class RankPageRoute extends StatefulWidget {
  RankPageRoute({Key? key}) : super(key: key);

  @override
  _RankPageRouteState createState() => _RankPageRouteState();
}

class _RankPageRouteState extends State<RankPageRoute>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = ['最新', '最热', '排名'];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [_buildTopNavBar(), _buildTabView()],
    ));
  }

  _buildTabView() {
    return Flexible(
      child: TabBarView(controller: _tabController, children: [
        Center(
          child: Text('xxxx'),
        ),
        Center(
          child: Text('xxxx'),
        ),
        Center(
          child: Text('xxxx'),
        )
      ]),
    );
  }

  _buildTopNavBar() {
    return Container(
      decoration: bottomShadow(),
      child: TopNavigationBar(
        child: BiTabbar(
          tabs: _tabs,
          tabController: _tabController,
          fontsize: 18,
          insets: 20,
          unselectedCor: Colors.black87,
        ),
      ),
    );
  }
}
