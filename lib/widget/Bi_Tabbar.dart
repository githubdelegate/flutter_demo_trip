import 'package:flutter/material.dart';
import 'package:new_fl/util/color.dart';

class BiTabbar extends StatelessWidget {
  const BiTabbar(
      {Key? key,
      required this.tabs,
      required this.tabController,
      this.fontsize = 13,
      this.insets = 15,
      this.borderWidth = 2,
      this.selectedCor = primaryCor,
      this.unselectedCor = defalutCor})
      : super(key: key);

  final List<String> tabs;
  final TabController tabController;
  final double fontsize;
  final double borderWidth;
  final double insets;
  final Color unselectedCor;
  final Color selectedCor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      controller: tabController,
      isScrollable: true,
      labelColor: selectedCor,
      unselectedLabelColor: unselectedCor,
      labelStyle: TextStyle(fontSize: fontsize),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: primaryCor, width: borderWidth),
        insets: EdgeInsets.only(left: insets, right: insets),
      ),
    );
  }
}
