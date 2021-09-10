import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/model/config_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel(this.config, this.bannerList, this.localNavList, this.subNavList,
      this.gridNav, this.salesBox);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bl =
        bannerListJson.map((e) => CommonModel.fromJson(e)).toList();
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> ll =
        localNavListJson.map((e) => CommonModel.fromJson(e)).toList();
    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> sl =
        subNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    return HomeModel(
        ConfigModel.fromJson(json['config']),
        bl,
        ll,
        sl,
        GridNavModel.fromJson(json['gridNav']),
        SalesBoxModel.fromJson(json['salesBox']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}