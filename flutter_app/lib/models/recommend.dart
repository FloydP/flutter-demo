class Recommend {
  int _code;
  String _msg;
  RecommendData _data;
  int _now;

  Recommend({int code, String msg, RecommendData data, int now}) {
    this._code = code;
    this._msg = msg;
    this._data = data;
    this._now = now;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  RecommendData get data => _data;
  set data(RecommendData data) => _data = data;
  int get now => _now;
  set now(int now) => _now = now;

  Recommend.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _msg = json['msg'];
    _data = json['data'] != null ? new RecommendData.fromJson(json['data']) : null;
    _now = json['now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    data['now'] = this._now;
    return data;
  }
}

class RecommendData {
  List<Pt> _pt;
  List<League> _league;

  RecommendData({List<Pt> pt, List<League> league}) {
    this._pt = pt;
    this._league = league;
  }

  List<Pt> get pt => _pt;
  set pt(List<Pt> pt) => _pt = pt;
  List<League> get league => _league;
  set league(List<League> league) => _league = league;

  RecommendData.fromJson(Map<String, dynamic> json) {
    if (json['pt'] != null) {
      _pt = new List<Pt>();
      json['pt'].forEach((v) {
        _pt.add(new Pt.fromJson(v));
      });
    }
    if (json['league'] != null) {
      _league = new List<League>();
      json['league'].forEach((v) {
        _league.add(new League.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._pt != null) {
      data['pt'] = this._pt.map((v) => v.toJson()).toList();
    }
    if (this._league != null) {
      data['league'] = this._league.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pt {
  int _cid;
  String _avatar;
  String _petName;
  String _describe;
  double _unitPrice;
  double _commentScore;
  int _orderCount;

  Pt(
      {int cid,
        String avatar,
        String petName,
        String describe,
        double unitPrice,
        double commentScore,
        int orderCount}) {
    this._cid = cid;
    this._avatar = avatar;
    this._petName = petName;
    this._describe = describe;
    this._unitPrice = unitPrice;
    this._commentScore = commentScore;
    this._orderCount = orderCount;
  }

  int get cid => _cid;
  set cid(int cid) => _cid = cid;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get petName => _petName;
  set petName(String petName) => _petName = petName;
  String get describe => _describe;
  set describe(String describe) => _describe = describe;
  double get unitPrice => _unitPrice;
  set unitPrice(double unitPrice) => _unitPrice = unitPrice;
  double get commentScore => _commentScore;
  set commentScore(double commentScore) => _commentScore = commentScore;
  int get orderCount => _orderCount;
  set orderCount(int orderCount) => _orderCount = orderCount;

  Pt.fromJson(Map<String, dynamic> json) {
    _cid = json['cid'];
    _avatar = json['avatar'];
    _petName = json['petName'];
    _describe = json['describe'];
    _unitPrice = json['unitPrice'];
    _commentScore = json['commentScore'];
    _orderCount = json['orderCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this._cid;
    data['avatar'] = this._avatar;
    data['petName'] = this._petName;
    data['describe'] = this._describe;
    data['unitPrice'] = this._unitPrice;
    data['commentScore'] = this._commentScore;
    data['orderCount'] = this._orderCount;
    return data;
  }
}

class League {
  int _classprice;
  Null _displayprice;
  int _cid;
  String _courseImgUrl;
  String _courseTitle;
  String _coachAndViceNames;
  String _coach;
  int _courseStartTime;
  int _courseEndTime;

  League(
      {int classprice,
        Null displayprice,
        int cid,
        String courseImgUrl,
        String courseTitle,
        String coachAndViceNames,
        String coach,
        int courseStartTime,
        int courseEndTime}) {
    this._classprice = classprice;
    this._displayprice = displayprice;
    this._cid = cid;
    this._courseImgUrl = courseImgUrl;
    this._courseTitle = courseTitle;
    this._coachAndViceNames = coachAndViceNames;
    this._coach = coach;
    this._courseStartTime = courseStartTime;
    this._courseEndTime = courseEndTime;
  }

  int get classprice => _classprice;
  set classprice(int classprice) => _classprice = classprice;
  Null get displayprice => _displayprice;
  set displayprice(Null displayprice) => _displayprice = displayprice;
  int get cid => _cid;
  set cid(int cid) => _cid = cid;
  String get courseImgUrl => _courseImgUrl;
  set courseImgUrl(String courseImgUrl) => _courseImgUrl = courseImgUrl;
  String get courseTitle => _courseTitle;
  set courseTitle(String courseTitle) => _courseTitle = courseTitle;
  String get coachAndViceNames => _coachAndViceNames;
  set coachAndViceNames(String coachAndViceNames) =>
      _coachAndViceNames = coachAndViceNames;
  String get coach => _coach;
  set coach(String coach) => _coach = coach;
  int get courseStartTime => _courseStartTime;
  set courseStartTime(int courseStartTime) =>
      _courseStartTime = courseStartTime;
  int get courseEndTime => _courseEndTime;
  set courseEndTime(int courseEndTime) => _courseEndTime = courseEndTime;

  League.fromJson(Map<String, dynamic> json) {
    _classprice = json['classprice'];
    _displayprice = json['displayprice'];
    _cid = json['cid'];
    _courseImgUrl = json['courseImgUrl'];
    _courseTitle = json['courseTitle'];
    _coachAndViceNames = json['coachAndViceNames'];
    _coach = json['coach'];
    _courseStartTime = json['courseStartTime'];
    _courseEndTime = json['courseEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classprice'] = this._classprice;
    data['displayprice'] = this._displayprice;
    data['cid'] = this._cid;
    data['courseImgUrl'] = this._courseImgUrl;
    data['courseTitle'] = this._courseTitle;
    data['coachAndViceNames'] = this._coachAndViceNames;
    data['coach'] = this._coach;
    data['courseStartTime'] = this._courseStartTime;
    data['courseEndTime'] = this._courseEndTime;
    return data;
  }
}
