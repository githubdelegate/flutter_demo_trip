import 'package:flutter/material.dart';
import 'package:new_fl/pages/rank_tab_page.dart';
import 'package:new_fl/util/view_util.dart';
import 'package:new_fl/widget/bi_tabbar.dart';
import 'package:new_fl/widget/top_navigator_bar.dart';

class FavoritePageRoute extends StatefulWidget {
  FavoritePageRoute({Key? key}) : super(key: key);

  @override
  _FavorPageRouteState createState() => _FavorPageRouteState();
}

class _FavorPageRouteState extends State<FavoritePageRoute>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = ['收藏'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: bottomShadow(),
          child: const TopNavigationBar(
              child: Text(
            '收藏',
            style: TextStyle(fontSize: 18),
          )),
        ),
        Flexible(child: RankTabRoute())
      ],
    ));
  }
}
