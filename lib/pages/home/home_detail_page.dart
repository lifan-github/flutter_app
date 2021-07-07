import 'dart:developer';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context)!.settings.arguments;
    print('传递参数:$args');
    // debugger(); 端点调试
    return Scaffold(
      appBar: AppBar(
        title: Text("首页详情"),
      ),
      body: Center(
        child: Text('$args'),
      ),
    );
  }
}
