class Banners {
  int _code;
  String _msg;
  List<BannerItem> _data;
  int _now;

  Banners({int code, String msg, List<BannerItem> data, int now}) {
    this._code = code;
    this._msg = msg;
    this._data = data;
    this._now = now;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  List<BannerItem> get data => _data;
  set data(List<BannerItem> data) => _data = data;
  int get now => _now;
  set now(int now) => _now = now;

  Banners.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = new List<BannerItem>();
      json['data'].forEach((v) {
        _data.add(new BannerItem.fromJson(v));
      });
    }
    _now = json['now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['now'] = this._now;
    return data;
  }
}

class BannerItem {
  String _path;
  String _imageUrl;
  String _action;
  String _title;

  BannerItem({String path, String imageUrl, String action, String title}) {
    this._path = path;
    this._imageUrl = imageUrl;
    this._action = action;
    this._title = title;
  }

  String get path => _path;
  set path(String path) => _path = path;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  String get action => _action;
  set action(String action) => _action = action;
  String get title => _title;
  set title(String title) => _title = title;

  BannerItem.fromJson(Map<String, dynamic> json) {
    _path = json['path'];
    _imageUrl = json['imageUrl'];
    _action = json['action'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this._path;
    data['imageUrl'] = this._imageUrl;
    data['action'] = this._action;
    data['title'] = this._title;
    return data;
  }
}
