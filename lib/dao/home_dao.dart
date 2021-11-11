import 'package:dio/dio.dart';
import 'package:new_fl/models/video_model.dart';

class HomeDao {
  static Future<HomeModel> get() async {
    var reponse = await Dio().get(
        'http://api.bilibili.com/x/web-interface/archive/related',
        queryParameters: {'aid': 7});

    var homeModel = HomeModel.fromJson(reponse.data);
    print('homedao= ${reponse.data}');
    return homeModel;
  }
}
