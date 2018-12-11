import 'dart:async';

class DialogBLoC {
  int _count;

  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;

  int get value => _count;

  showLoading() {
    _countController.sink.add(_count = 0);
  }

  dispose() {
    _countController.close();
  }
}
