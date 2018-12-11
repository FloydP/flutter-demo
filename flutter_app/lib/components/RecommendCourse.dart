import 'package:flutter/material.dart';
import 'package:flutter_app/models/recommend.dart';

class RecommendCourse extends Container {
  League _league;

  RecommendCourse(League league) {
    _league = league;
  }

  @override
  EdgeInsetsGeometry get margin =>
      _league == null ? null : EdgeInsets.only(bottom: 14);

  @override
  Decoration get decoration => BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0x5BB7B7B7), blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)));

  @override
  Widget get child => _league == null
      ? null
      : Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 125),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      child: Image.network(
                        _league.courseImgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints.expand(width: 71, height: 18),
                      decoration: BoxDecoration(color: Color(0xff5BBDDE)),
                      child: Center(
                        child: Text(
                          "07:00 - 07:40",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        _league.courseTitle,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0x10F05522),
                        child: Text(
                          _league.coachAndViceNames,
                          style:
                              TextStyle(color: Color(0xffF05522), fontSize: 11),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        _league.coach,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff909090)),
                      )),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          '￥ ' + String.fromCharCode(_league.classprice),
                          style: TextStyle(
                              color: Color(0xff00C3AA),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
}
