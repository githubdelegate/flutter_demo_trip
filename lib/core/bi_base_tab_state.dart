import 'package:flutter/material.dart';
import 'package:new_fl/core/bi_state.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/util/color.dart';
import 'package:new_fl/util/view_util.dart';

/// 包含了 上拉刷新和和下拉加载更多的state， 想要这个功能的widget 直接继承这个类就好了
/// M 为数据列表
abstract class BiBaseTabState<M extends List, T extends StatefulWidget>
    extends BiState<T> with AutomaticKeepAliveClientMixin {
  ///
  ScrollController scrollController = ScrollController();

  /// 数据列表
  List dataList = List.empty(growable: true);

  /// 是否正在加载...
  bool isLoading = false;

  /// 当前页码
  int pageIdx = 1;

  /// 之类必须返回 子内容
  Widget get childContent;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      var dis = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      if (dis < 300 &&
          isLoading == false &&
          scrollController.position.maxScrollExtent != 0) {
        loadData(isLoadMore: true);
      }
    });

    loadData();
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      child: childContent,
      onRefresh: loadData,
      color: primaryCor,
    );
  }

  /// 请求对应数据
  Future<M> getData(int idx);

  /// 刷新加载数据
  /// loadMore 表示 是否 是加载更多数据
  Future loadData({isLoadMore = false}) async {
    if (isLoading) {
      print('正在加载中...');
      return;
    }
    isLoading = true;
    var currentIdx = pageIdx;
    if (isLoadMore) {
      currentIdx = pageIdx + 1;
    } else {
      pageIdx = 1;
    }

    try {
      var result = await getData(currentIdx);
      setState(() {
        if (isLoadMore) {
          dataList = [...dataList, ...result];
        } else {
          dataList = [...result];
        }
        isLoading = false;

        showToast('刷新完成');
      });
    } catch (e) {
      isLoading = false;
      showErrorToast('请求数据错误+${e}');
    }
  }

  @override
  bool get wantKeepAlive => true;
}
