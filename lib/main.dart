import 'package:flutter/material.dart';
import 'router/TabNavigator.dart';
import 'pages/starting/index.dart';
import 'pages/login/login.dart';
// 首页
import 'pages/home/home_detail_page.dart';
// 资产
import 'pages/cate/cate_detail_page.dart';
// 我的
import 'pages/user/user_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "starting_page",
      routes: {
        "starting_page": (context) => StartingPage(),
        "login_page": (context) => LoginPage(),
        "main_page": (context) => TabNavigator(),
        "home_detail_page": (context) => HomeDetailPage(),
        "cate_detail_page": (context) => CateDetailPage(),
        "user_detail_page": (context) => UserDetailPage(),
      },
      home: TabNavigator(),
    );
  }
}

