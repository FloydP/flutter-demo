import 'package:flutter/material.dart';
import 'package:flutter_app/models/recommend.dart';

class RecommendCoach extends Container {
  Pt _pt;

  RecommendCoach(Pt pt) {
    _pt = pt;
  }

  @override
  Decoration get decoration => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      boxShadow: <BoxShadow>[
        BoxShadow(color: Color(0x5BB7B7B7), blurRadius: 10)
      ],
      color: Colors.white);

  @override
  Widget get child => _pt == null
      ? null
      : Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(_pt.avatar, scale: 1),
                radius: 35,
                backgroundColor: Colors.grey,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            _pt.petName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 6, right: 6, top: 2, bottom: 2),
                          color: Color(0x10F05522),
                          child: Text(
                            "热门教练",
                            style: TextStyle(
                                fontSize: 11, color: Color(0xffF05522)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        _pt.commentScore.toString() +
                            "分   " +
                            _pt.orderCount.toString() +
                            "单   " +
                            "今日可约",
                        style:
                            TextStyle(color: Color(0xff3A444A), fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        _pt.describe,
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        );
}
