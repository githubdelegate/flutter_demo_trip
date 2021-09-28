import 'package:dio/dio.dart';
import 'package:flutter_demo/model/travel_model.dart';

class TravelDao {
  static Future<TravelModel> fetch(String url, Map params, String channelCode,
      int type, int pageIdx, int pageSize) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIdx;
    paramsMap['pageSize'] = pageSize;
    params['groupChannelCode'] = channelCode;
    params['type'] = type;

    Response res = await Dio().post(url, data: params);
    if (res.statusCode == 200) {
      return TravelModel.fromJson(res.data);
    } else {
      throw Exception('xx');
    }
  }
}
