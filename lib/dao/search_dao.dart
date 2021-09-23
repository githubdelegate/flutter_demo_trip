import 'package:dio/dio.dart';
import 'package:flutter_demo/model/search_model.dart';

const Search_url =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchDao {
  static Future<SearchModel> fetch(String keyword) async {
    var response = await Dio().get(Search_url + keyword);
    if (response.statusCode == 200) {
      var model = SearchModel.fromJson(response.data);
      model.keyword = keyword;
      return model;
    } else {
      throw Exception("search dao fail");
    }
  }
}
