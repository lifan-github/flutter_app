import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/pages/home/index.dart';
import 'package:flutter_app/pages/cate/index.dart';
import 'package:flutter_app/pages/user/index.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  late DateTime _lastPressedAt;
  int _selectedIndex = 0;
  List pages = [MyHomePage(title: "首页"), MyCatePage(title: "资产"), MyUserPage(title: "我的")];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if(DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)){
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            Fluttertoast.showToast(
                msg: "再次点击退出APP",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          }
          return true;
        },
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "资产"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "我的"),
        ],
        fixedColor: Colors.blue,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
