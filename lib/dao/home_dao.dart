import 'package:dio/dio.dart';
import 'package:new_fl/models/video_model.dart';

class HomeDao {
  static Future<HomeModel> get({int aid = 7}) async {
    var reponse = await Dio().get(
        'http://api.bilibili.com/x/web-interface/archive/related',
        queryParameters: {'aid': aid});

    var homeModel = HomeModel.fromJson(reponse.data);
    print('homedao= ${reponse.data}');
    return homeModel;
  }
}
