import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_fl/dao/home_dao.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/widget/video_card.dart';

class HomeCategoryPageRoute extends StatefulWidget {
  const HomeCategoryPageRoute({Key? key}) : super(key: key);

  @override
  _HomeCategoryPageRouteState createState() => _HomeCategoryPageRouteState();
}

class _HomeCategoryPageRouteState extends State<HomeCategoryPageRoute> {
  List<VideoModel> _videos = [];
  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Future<void> _loadData() async {
    var homeModel = await HomeDao.get();
    setState(() {
      _videos = homeModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.98),
            itemCount: _videos.length,
            shrinkWrap: true,
            itemBuilder: (context, idx) {
              return VideoCard(model: _videos[idx]);
            }));
    // StaggeredGridView.countBuilder(
    //     physics: const AlwaysScrollableScrollPhysics(),
    //     padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    //     crossAxisCount: 2,
    //     itemCount: _videos.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return VideoCard(model: _videos[index]);
    //     },
    //     staggeredTileBuilder: (int index) {
    //       return const StaggeredTile.fit(1);
    //     }));
  }
}
