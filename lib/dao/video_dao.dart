import 'package:dio/dio.dart';
import 'package:new_fl/models/video_detail_model.dart';

class VideoDao {
  static Future<VideoDetailInfoModel> getVideoPlayInfo(
      int avid, int cid) async {
    var response = await Dio().get('http://api.bilibili.com/x/player/playurl',
        queryParameters: {'avid': avid, 'cid': cid});

    var json = response.data['data'];
    var model = VideoDetailInfoModel.fromJson(json);
    return model;
  }
}
