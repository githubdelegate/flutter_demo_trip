import 'package:flutter_demo/model/common_model.dart';

class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(this.startColor, this.endColor, this.mainItem, this.item1,
      this.item2, this.item3, this.item4);

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
        json['startColor'],
        json['endColor'],
        CommonModel.fromJson(json['mainItem']),
        CommonModel.fromJson(json['item1']),
        CommonModel.fromJson(json['item2']),
        CommonModel.fromJson(json['item3']),
        CommonModel.fromJson(json['item4']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startColor'] = startColor;
    data['endColor'] = endColor;
    data['mainItem'] = mainItem.toJson();
    data['item1'] = item1.toJson();
    if (item2 != null) {
      data['item2'] = item2.toJson();
    }
    if (item3 != null) {
      data['item3'] = item3.toJson();
    }
    if (item4 != null) {
      data['item4'] = item4.toJson();
    }
    return data;
  }
}

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel(this.hotel, this.flight, this.travel);

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
        GridNavItem.fromJson(json['hotel']),
        GridNavItem.fromJson(json['flight']),
        GridNavItem.fromJson(json['travel']));
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotel != null) {
      data['hotel'] = hotel.toJson();
    }
    if (flight != null) {
      data['flight'] = flight.toJson();
    }
    if (travel != null) {
      data['travel'] = travel.toJson();
    }
    return data;
  }
}
