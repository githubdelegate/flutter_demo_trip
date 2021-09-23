import 'dart:convert';
import 'dart:core';

// 搜索model
class SearchModel {
  String keyword = '';
  List<SearchItem> data = [];

  SearchModel({required this.keyword, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'] is List ? <SearchItem>[] : null;
    if (data != null) {
      for (var item in json['data']) {
        data.add(SearchItem.fromJson(item));
      }
    }

    return SearchModel(keyword: json['keyword'], data: data!);
  }

  Map<String, dynamic> toJson() => {'keyword': keyword, 'data': data};

  @override
  String toString() {
    return jsonEncode(this);
  }

  SearchModel clone() => SearchModel.fromJson(jsonDecode(jsonEncode(this)));
}

class SearchItem {
  String word = "";
  String url = "";
  String type = "";
  String price = '';
  String star = '';
  String zonename = '';
  String districtname = '';

  SearchItem(
      {this.word = '',
      this.url = '',
      this.type = '',
      this.price = '',
      this.star = '',
      this.zonename = '',
      this.districtname = ''});

  factory SearchItem.fromJson(Map<String, dynamic> json) => SearchItem(
      word: json['word'],
      url: json['url'],
      type: json['type'],
      price: json['price'],
      star: json['star'],
      zonename: json['zonename'],
      districtname: json['districtname']);

  Map<String, dynamic> toJson() => {
        'word': word,
        'type': type,
        'url': url,
        'price': price,
        'star': star,
        'zonename': zonename,
        'districtname': districtname
      };
}
