import 'package:flutter/material.dart';
import 'package:new_fl/util/color.dart';

class BiTabbar extends StatelessWidget {
  const BiTabbar({Key? key, required this.tabs, required this.tabController})
      : super(key: key);

  final List<String> tabs;
  final TabController tabController;
  final double fontsize = 13;
  final double borderWidth = 2;
  final double insets = 15;
  final Color unselectedCor = defalutCor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs.map((e) => Text(e)).toList(),
      controller: tabController,
      isScrollable: true,
      labelColor: defalutCor,
      unselectedLabelColor: unselectedCor,
      labelStyle: TextStyle(fontSize: fontsize),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryCor, width: borderWidth),
        insets: EdgeInsets.only(left: insets, right: insets),
      ),
    );
  }
}
