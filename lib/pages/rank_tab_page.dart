import 'package:flutter/material.dart';
import 'package:new_fl/core/bi_base_tab_state.dart';
import 'package:new_fl/dao/home_dao.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/widget/video_large_image.dart';

/// rank tab 子页面
class RankTabRoute extends StatefulWidget {
  RankTabRoute({Key? key}) : super(key: key);

  @override
  _RankTabPoageState createState() => _RankTabPoageState();
}

class _RankTabPoageState extends BiBaseTabState<List, RankTabRoute> {
  @override
  Widget get childContent {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
            child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.only(top: 10),
                itemCount: dataList.length,
                itemBuilder: (cxt, idx) {
                  return VideoLargeImageCard(model: dataList[idx]);
                })));
  }

  @override
  Future<List<VideoModel>> getData(int idx) async {
    var aid = 7;
    if (idx > 1) {
      var lastModel = dataList.last as VideoModel;
      aid = lastModel.aid;
    }
    var model = await HomeDao.get(aid: aid);
    return model.data;
  }
}
