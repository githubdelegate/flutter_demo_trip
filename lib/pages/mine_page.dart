import 'package:flutter/material.dart';
import 'package:new_fl/util/color.dart';
import 'package:new_fl/util/view_util.dart';
import 'package:new_fl/widget/Bi_blur.dart';

class MinePageRoute extends StatefulWidget {
  MinePageRoute({Key? key}) : super(key: key);

  @override
  _MinePageRouteState createState() => _MinePageRouteState();
}

class _MinePageRouteState extends State<MinePageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext ctx, bool isbox) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  expandedHeight: 160,
                  snap: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      title: _buildHeaderView(),
                      background: Stack(
                        children: [
                          Positioned.fill(
                              child: Image.network(
                            'https://img2.baidu.com/it/u=2795724226,3705372660&fm=26&fmt=auto',
                            fit: BoxFit.fitWidth,
                          )),
                          Positioned.fill(
                              child: BiBlur(
                            blurValue: 10,
                          ))
                        ],
                      )),
                )
              ];
            },
            body: ListView.builder(
                itemCount: 20,
                itemBuilder: (ctx, idx) {
                  return ListTile(
                    title: Text('--->${idx}'),
                  );
                })));
  }

  _buildHeaderView() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Icon(Icons.people_alt_sharp),
          ),
          biSpace(wid: 10),
          Text(
            'xxxx',
            style: TextStyle(color: primaryCor),
          )
        ],
      ),
    );
  }
}
