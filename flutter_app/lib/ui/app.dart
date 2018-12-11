import 'package:flutter/material.dart';
import 'package:flutter_app/ui/homepage.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primaryColor: const Color(0xFF00C3AA)),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeFragment(title:"懒人易健"),
      bottomNavigationBar: MyBottomBar(
        selectIndex: _selectIndex,
        onChanged: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}

// -------------------------------- bottomBar-----------------------------
class MyBottomBar extends StatefulWidget {
  MyBottomBar({Key k, this.selectIndex, this.onChanged}) : super(key: k);

  final ValueChanged<int> onChanged;
  final int selectIndex;

  @override
  State<StatefulWidget> createState() {
    return MyBottomBarState();
  }
}

class MyBottomBarState extends State<MyBottomBar> {
  var _bottomBarItem = ['首页', '预约', '我的'];
  var _bottomBarItemIcon = [Icons.home, Icons.timer, Icons.verified_user];

  void _onItemTapped(int i) {
    widget.onChanged(i);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List<BottomNavigationBarItem>.generate(
          _bottomBarItem.length,
          (i) => BottomNavigationBarItem(
                icon: Icon(
                  _bottomBarItemIcon[i],
                ),
                title: Text(_bottomBarItem[i]),
              )),
      currentIndex: widget.selectIndex,
      onTap: _onItemTapped,
    );
  }
}
