// ignore_for_file: unnecessary_this

import 'package:flutter_demo/model/common_model.dart';

class SalesBoxModel {
  final String icon;
  final String moreUrl;
  final CommonModel bigCard1;
  final CommonModel bigCard2;
  final CommonModel smallCard1;
  final CommonModel smallCard2;
  final CommonModel smallCard3;
  final CommonModel smallCard4;

  SalesBoxModel(this.icon, this.moreUrl, this.bigCard1, this.bigCard2,
      this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4);

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
        json['icon'],
        json['moreUrl'],
        CommonModel.fromJson(json['bigCard1']),
        CommonModel.fromJson(json['bigCard2']),
        CommonModel.fromJson(json['smallCard1']),
        CommonModel.fromJson(json['smallCard2']),
        CommonModel.fromJson(json['smallCard3']),
        CommonModel.fromJson(json['smallCard4']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['moreUrl'] = moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = bigCard1.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = bigCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = smallCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = smallCard2.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = smallCard3.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = smallCard4.toJson();
    }
    return data;
  }
}
