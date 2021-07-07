import 'package:flutter/material.dart';

class MyUserPage extends StatefulWidget {
  MyUserPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyUserPageState createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '我的内容',
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed("user_detail_page", arguments: "我是上页面传过来的参数");
              },
            )
          ],
        ),
      ),
    );
  }
}