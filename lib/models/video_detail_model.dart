class VideoDetailInfoModel {
  List<Durl> durl = [];

  VideoDetailInfoModel({required this.durl});

  VideoDetailInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['durl'] != null) {
      durl = List<Durl>.empty(growable: true);
      json['durl'].forEach((v) {
        durl.add(Durl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.durl != null) {
      data['durl'] = this.durl.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// 视频播放地址
class Durl {
  int order = 0;
  int length = 0;
  int size = 0;
  String ahead = '';
  String vhead = '';
  String url = '';

  Durl(
      {this.order = 0,
      this.length = 0,
      this.size = 0,
      this.ahead = '',
      this.vhead = '',
      this.url = ''});

  Durl.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    length = json['length'];
    size = json['size'];
    ahead = json['ahead'];
    vhead = json['vhead'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['length'] = this.length;
    data['size'] = this.size;
    data['ahead'] = this.ahead;
    data['vhead'] = this.vhead;
    data['url'] = this.url;
    return data;
  }
}
