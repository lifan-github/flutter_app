import 'dart:async';
import 'package:flutter/material.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  late Timer _timer;
  int _count = 3;
  bool appToken = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      // 定时任务
      _count--;
      if (_count == 1) {
        _timer.cancel();
        if (appToken) {
          Navigator.pushReplacementNamed(context, "main_page");
        } else {
          Navigator.pushReplacementNamed(context, "login_page");
        }
      }
      setState(() {});
    });
  }

  // 组件卸载 清除定时器
  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("lib/assets/images/logo.png", width: 150.0),
              Text(
                '$_count',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ]),
      ),
    );
  }
}
