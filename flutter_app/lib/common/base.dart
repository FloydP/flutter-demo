import 'package:flutter/material.dart';
import 'package:flutter_app/components/dialog.dart';

class Base extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }

  void showLoading(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            //调用对话框
            text: '获取位置...',
          );
        });
  }

  void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}

class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadFail(VoidCallback onPressed) {
    return Center(
      child: RaisedButton(
        onPressed: onPressed,
        child: Text('刷新'),
      ),
    );
  }
}
