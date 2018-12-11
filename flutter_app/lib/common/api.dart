import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/models/location.dart';
import 'package:flutter_app/models/banners.dart';
import 'package:flutter_app/models/recommend.dart';

class Api {
  static Api _api;

  Dio _dio;

  static Api get instance => _getInstance();

  Api._instance() {
    _dio = Dio();
    _dio.options.baseUrl = "https://tsgate.lanrenyun.cn/api/lryj/v3/support";
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
  }

  static Api _getInstance() {
    if (_api == null) {
      _api = new Api._instance();
    }
    return _api;
  }

  Future<Position> GPS() async {
    return await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<Location> getLocation(double latitude, double longitude) async {
    print('getLocation');
    var response = await _dio.post('/service/citys',
        data: {'latitude': latitude, 'longitude': longitude});
    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(json.encode(response.data)));
    } else {
      return null;
    }
  }

  Future<Banners> getBanners() async {
    print('get banners start ');
    var response = await _dio
        .post('/banners', data: {'app': 'lryjmini', 'version': '1.2.7'});
    if (response.statusCode == 200) {
      return Banners.fromJson(json.decode(json.encode(response.data)));
    } else {
      return null;
    }
  }

  Future<Recommend> getRecommend(
      String uid, String cityId, double latitude, double longitude) async {
    print('get recommend stat');
    var response = await _dio.post('/service/recommend', data: {
      'uid': 1541390469508,
      'cityId': 350100000000,
      'latitude': latitude,
      'longitude': longitude
    });
    if (response.statusCode == 200) {
      return Recommend.fromJson(json.decode(json.encode(response.data)));
    } else
      return null;
  }
}
