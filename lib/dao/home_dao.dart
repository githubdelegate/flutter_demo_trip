import 'dart:convert';

import 'package:flutter_demo/model/home_model.dart';
import 'package:http/http.dart' as http;

const HomeDaoURL = "http://www.devio.org/io/flutter_app/json/home_page.json";

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HomeDaoURL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8Decoder = Utf8Decoder();
      var result = json.decode(utf8Decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('failed load home dao json');
    }
  }
}
