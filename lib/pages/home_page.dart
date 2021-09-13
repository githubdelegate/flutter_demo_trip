import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/home_dao.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_demo/model/sales_box_model.dart';
import 'package:flutter_demo/widget/common_util.dart';
import 'package:flutter_demo/widget/grid_nav.dart';
import 'package:flutter_demo/widget/loading_container.dart';
import 'package:flutter_demo/widget/local_nav.dart';
import 'package:flutter_demo/widget/sales_box.dart';
import 'package:flutter_demo/widget/sub_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  String name = "Home";
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

const APPBAR_SCROLL_OFFSET = 100;

class _HomePageState extends State {
  List _imageUrl = [
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg'
  ];

  double _appbarOp = 0.0;
  bool _isLoading = true;
  var _homejson = '';
  var _localNavList;
  GridNavModel? gridNavModel;
  List<CommonModel>? subNavModel;
  SalesBoxModel? saleboxModel;
  List<CommonModel> bannerList = [];

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appbarOp = alpha;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadHomeJson();
  }

  Future<Void?> _loadHomeJson() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        _homejson = json.encode(model);
        _localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavModel = model.subNavList;
        saleboxModel = model.salesBox;
        bannerList = model.bannerList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _homejson = e.toString();
        _isLoading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: LoadingContainer(
            Stack(
              children: [
                MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: RefreshIndicator(
                      child: _listView,
                      onRefresh: _loadHomeJson,
                      color: Colors.red,
                    )),
                _appBar
              ],
            ),
            _isLoading,
            true));
  }

  Widget get _appBar {
    return Opacity(
        opacity: _appbarOp,
        child: Container(
          height: 80,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child:
                Padding(padding: EdgeInsets.only(top: 20), child: Text('Home')),
          ),
        ));
  }

  Widget get _listView {
    return NotificationListener(
        onNotification: (noti) {
          if (noti is ScrollUpdateNotification && noti.depth == 0) {
            print(noti.metrics.pixels);
            _onScroll(noti.metrics.pixels);
          }
          return true;
        },
        child: ListView(
          children: [
            Container(
              height: 160,
              child: Swiper(
                itemCount: bannerList.length,
                autoplay: true,
                itemBuilder: (BuildContext ctx, int idx) {
                  return CommonUtil.wrapGesture(
                      ctx,
                      Image.network(bannerList[idx].icon, fit: BoxFit.fill),
                      bannerList[idx]);
                },
                pagination:
                    const SwiperPagination(alignment: Alignment.bottomCenter),
              ),
            ),
            Padding(
                child: LocalNav(localNavList: _localNavList),
                padding: const EdgeInsets.fromLTRB(7, 4, 7, 4)),

            // 三行卡片
            Padding(
                child: GridNav(gridNavModel: gridNavModel),
                padding: const EdgeInsets.fromLTRB(7, 0, 7, 4)),

            // 两排列表
            Padding(
                child: SubNav(
                  subnavlist: subNavModel,
                ),
                padding: const EdgeInsets.fromLTRB(7, 0, 7, 4)),

            //  做下面卡片
            Padding(
                child: SalesBox(salesBoxModel: saleboxModel),
                padding: const EdgeInsets.fromLTRB(7, 0, 7, 4)),
          ],
        ));
  }
}
