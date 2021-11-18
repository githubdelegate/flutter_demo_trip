import 'package:flutter/material.dart';
import 'package:new_fl/dao/video_dao.dart';
import 'package:new_fl/models/video_detail_model.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/util/color.dart';
import 'package:new_fl/widget/bi_tabbar.dart';
import 'package:new_fl/widget/expand_video_content.dart';
import 'package:new_fl/widget/top_navigator_bar.dart';
import 'package:new_fl/widget/video_list_header.dart';
import 'package:new_fl/widget/video_view.dart';

class VideoPlayRoute extends StatefulWidget {
  VideoPlayRoute({Key? key, required this.model}) : super(key: key);

  final VideoModel model;

  @override
  _VideoPlayRouteState createState() => _VideoPlayRouteState();
}

class _VideoPlayRouteState extends State<VideoPlayRoute>
    with TickerProviderStateMixin {
  String _videoUrl = '';

  final List<String> _tabs = ['简介', '评论1000'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _loadData();
  }

  _loadData() async {
    var videoDetailModel = await VideoDao.getVideoPlayInfo(
        widget.model.stat!.aid, widget.model.cid);
    setState(() {
      _videoUrl = videoDetailModel.durl.first.url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Column(
              children: [
                const TopNavigationBar(
                  color: Colors.black,
                  height: 46,
                ),
                VideoView(_videoUrl),
                _buildTab(),
                _buildTabView()
              ],
            )));
  }

  Widget _buildTab() {
    return Material(
      elevation: 5,
      shadowColor: primaryCor,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 39,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _tabbar(),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.live_tv_rounded,
                color: defalutCor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabbar() {
    return BiTabbar(tabs: _tabs, tabController: _tabController);
  }

  /// 创建两个tabview
  Widget _buildTabView() {
    // ExpansionTile
    return Flexible(
        child: TabBarView(
            controller: _tabController,
            children: [_authorListView(), _commentListView()]));
  }

  /// 作者相关列表
  Widget _authorListView() {
    return ListView(children: [
      VideoListHeader(
        owner: widget.model.owner!,
      ),
      ExpandVideoInfoContent(model: widget.model),
      Container(
        color: Colors.blue,
        height: 100,
      )
    ]);
  }

  Widget _titleInfo() {
    return Container();
  }

  /// 评论列表
  Widget _commentListView() {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('xxxx'),
      );
    });
  }
}
