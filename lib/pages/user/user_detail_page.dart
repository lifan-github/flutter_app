import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context)!.settings.arguments;
    print('传递参数:$args');
    return Scaffold(
      appBar: AppBar(
        title: Text("我的详情"),
      ),
      body: Center(
        child: Text('$args'),
      ),
    );
  }
}
