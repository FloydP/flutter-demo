class Location {
  int _code;
  String _message;
  int _now;
  Data _data;

  Location({int code, String message, int now, Data data}) {
    this._code = code;
    this._message = message;
    this._now = now;
    this._data = data;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  int get now => _now;
  set now(int now) => _now = now;
  Data get data => _data;
  set data(Data data) => _data = data;

  Location.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _now = json['now'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    data['now'] = this._now;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  List<City> _list;
  City _curr;

  Data({List<City> list, City curr}) {
    this._list = list;
    this._curr = curr;
  }

  List<City> get list => _list;
  set list(List<City> list) => _list = list;
  City get curr => _curr;
  set curr(City curr) => _curr = curr;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      _list = new List<City>();
      json['list'].forEach((v) {
        _list.add(new City.fromJson(v));
      });
    }
    _curr = json['curr'] != null ? new City.fromJson(json['curr']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._list != null) {
      data['list'] = this._list.map((v) => v.toJson()).toList();
    }
    if (this._curr != null) {
      data['curr'] = this._curr.toJson();
    }
    return data;
  }
}

class City {
  String _name;
  String _code;
  int _status;

  City({String name, String code, int status}) {
    this._name = name;
    this._code = code;
    this._status = status;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;
  int get status => _status;
  set status(int status) => _status = status;

  City.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    data['status'] = this._status;
    return data;
  }
}

