import 'package:flutter/material.dart';
import 'package:new_fl/core/bi_base_tab_state.dart';
import 'package:new_fl/dao/home_dao.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/pages/rank_tab_page.dart';
import 'package:new_fl/util/view_util.dart';
import 'package:new_fl/widget/bi_tabbar.dart';
import 'package:new_fl/widget/top_navigator_bar.dart';
import 'package:new_fl/widget/video_large_image.dart';

/// rank 页面
class RankPageRoute extends StatefulWidget {
  RankPageRoute({Key? key}) : super(key: key);

  @override
  _RankPageRouteState createState() => _RankPageRouteState();
}

class _RankPageRouteState extends State<RankPageRoute>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ['最新', '最热', '排名'];
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
      child: TabBarView(
          controller: _tabController,
          children: _tabs.map((e) => RankTabRoute()).toList()),
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
