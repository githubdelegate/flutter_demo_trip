import 'package:dio/dio.dart';
import 'package:flutter_demo/model/travel_tab_model.dart';

const ktravelTabUrl =
    "https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/travel_page.json";

class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    Response res = await Dio().get(ktravelTabUrl);
    if (res.statusCode == 200) {
      return TravelTabModel.fromJson(res.data);
    } else {
      throw Exception('');
    }
  }
}
