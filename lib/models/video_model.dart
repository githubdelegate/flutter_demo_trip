class Rights {
  int bp = 0;
  int elec = 0;
  int download = 0;
  int movie = 0;
  int pay = 0;
  int hd5 = 0;
  int noReprint = 0;
  int autoplay = 0;
  int ugcPay = 0;
  int isCooperation = 0;
  int ugcPayPreview = 0;
  int noBackground = 0;

  Rights(
      {this.bp = 0,
      this.elec = 0,
      this.download = 0,
      this.movie = 0,
      this.pay = 0,
      this.hd5 = 0,
      this.noReprint = 0,
      this.autoplay = 0,
      this.ugcPay = 0,
      this.isCooperation = 0,
      this.ugcPayPreview = 0,
      this.noBackground = 0});

  Rights.fromJson(Map<String, dynamic> json) {
    bp = json['bp'];
    elec = json['elec'];
    download = json['download'];
    movie = json['movie'];
    pay = json['pay'];
    hd5 = json['hd5'];
    noReprint = json['no_reprint'];
    autoplay = json['autoplay'];
    ugcPay = json['ugc_pay'];
    isCooperation = json['is_cooperation'];
    ugcPayPreview = json['ugc_pay_preview'];
    noBackground = json['no_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bp'] = this.bp;
    data['elec'] = this.elec;
    data['download'] = this.download;
    data['movie'] = this.movie;
    data['pay'] = this.pay;
    data['hd5'] = this.hd5;
    data['no_reprint'] = this.noReprint;
    data['autoplay'] = this.autoplay;
    data['ugc_pay'] = this.ugcPay;
    data['is_cooperation'] = this.isCooperation;
    data['ugc_pay_preview'] = this.ugcPayPreview;
    data['no_background'] = this.noBackground;
    return data;
  }
}

class Owner {
  int mid = 0;
  String name = '';
  String face = '';

  Owner({this.mid = 0, this.name = '', this.face = ''});

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    name = json['name'];
    face = json['face'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['face'] = this.face;
    return data;
  }
}

class Stat {
  int aid = 0;
  int view = 0;
  int danmaku = 0;
  int reply = 0;
  int favorite = 0;
  int coin = 0;
  int share = 0;
  int nowRank = 0;
  int hisRank = 0;
  int like = 0;
  int dislike = 0;

  Stat(
      {this.aid = 0,
      this.view = 0,
      this.danmaku = 0,
      this.reply = 0,
      this.favorite = 0,
      this.coin = 0,
      this.share = 0,
      this.nowRank = 0,
      this.hisRank = 0,
      this.like = 0,
      this.dislike = 0});

  Stat.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    view = json['view'];
    danmaku = json['danmaku'];
    reply = json['reply'];
    favorite = json['favorite'];
    coin = json['coin'];
    share = json['share'];
    nowRank = json['now_rank'];
    hisRank = json['his_rank'];
    like = json['like'];
    dislike = json['dislike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['view'] = this.view;
    data['danmaku'] = this.danmaku;
    data['reply'] = this.reply;
    data['favorite'] = this.favorite;
    data['coin'] = this.coin;
    data['share'] = this.share;
    data['now_rank'] = this.nowRank;
    data['his_rank'] = this.hisRank;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    return data;
  }
}

class Dimension {
  int width = 0;
  int height = 0;
  int rotate = 0;

  Dimension({this.width = 0, this.height = 0, this.rotate = 0});

  Dimension.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    rotate = json['rotate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = width;
    data['height'] = height;
    data['rotate'] = rotate;
    return data;
  }
}

class VideoModel {
  int aid = 0;
  int videos = 0;
  int tid = 0;
  String tname = '';
  int copyright = 0;
  String pic = '';
  String title = '';
  int pubdate = 0;
  int ctime = 0;
  String desc = '';
  int state = 0;
  int duration = 0;
  Rights? rights;
  Owner? owner;
  Stat? stat;
  // String dynamic = '';
  int cid = 0;
  Dimension? dimension;
  String shortLink = '';
  String shortLinkV2 = '';
  String bvid = '';
  int seasonType = 0;
  bool isOgv = false;
  String rcmdReason = '';

  VideoModel(
      {this.aid = 0,
      this.videos = 0,
      this.tid = 0,
      this.tname = '',
      this.copyright = 0,
      this.pic = '',
      this.title = '',
      this.pubdate = 0,
      this.ctime = 0,
      this.desc = '',
      this.state = 0,
      this.duration = 0,
      this.rights,
      required this.owner,
      this.stat,
      // this.dynamic = '',
      this.cid = 0,
      this.dimension,
      this.shortLink = '',
      this.shortLinkV2 = '',
      this.bvid = '',
      this.seasonType = 0,
      this.isOgv = false,
      this.rcmdReason = ''});

  VideoModel.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    videos = json['videos'];
    tid = json['tid'];
    tname = json['tname'];
    copyright = json['copyright'];
    pic = json['pic'];
    title = json['title'];
    pubdate = json['pubdate'];
    ctime = json['ctime'];
    desc = json['desc'];
    state = json['state'];
    duration = json['duration'];
    rights = json['rights'] != null ? Rights.fromJson(json['rights']) : null;
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
    // dynamic = json['dynamic'];
    cid = json['cid'];
    dimension = json['dimension'] != null
        ? Dimension.fromJson(json['dimension'])
        : null;
    shortLink = json['short_link'];
    shortLinkV2 = json['short_link_v2'];
    bvid = json['bvid'];
    seasonType = json['season_type'];
    isOgv = json['is_ogv'];
    rcmdReason = json['rcmd_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['videos'] = this.videos;
    data['tid'] = this.tid;
    data['tname'] = this.tname;
    data['copyright'] = this.copyright;
    data['pic'] = this.pic;
    data['title'] = this.title;
    data['pubdate'] = this.pubdate;
    data['ctime'] = this.ctime;
    data['desc'] = this.desc;
    data['state'] = this.state;
    data['duration'] = this.duration;
    if (this.rights != null) {
      data['rights'] = rights!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.stat != null) {
      data['stat'] = this.stat!.toJson();
    }
    // data['dynamic'] = this.dynamic;
    data['cid'] = this.cid;
    if (this.dimension != null) {
      data['dimension'] = this.dimension!.toJson();
    }
    data['short_link'] = this.shortLink;
    data['short_link_v2'] = this.shortLinkV2;
    data['bvid'] = this.bvid;
    data['season_type'] = this.seasonType;
    data['is_ogv'] = this.isOgv;
    data['rcmd_reason'] = this.rcmdReason;
    return data;
  }
}

class HomeModel {
  List<VideoModel> data = [];

  HomeModel({required this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = List<VideoModel>.empty(growable: true);
      json['data'].forEach((v) {
        data.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();
    if (this.data != null) {
      json['data'] = data.map((e) => e.toJson()).toList();
    }
    return json;
  }
}
