import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/index.dart';
import 'package:flutter_app/pages/cate/index.dart';
import 'package:flutter_app/pages/user/index.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          MyHomePage(title: "首页"),
          MyCatePage(title: "资产"),
          MyUserPage(title: "我的"),
        ],
        physics: NeverScrollableScrollPhysics(), // 可左右滑动，不设置为可滑动
        onPageChanged: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.usb), label: "资产"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}
