import 'package:flutter/material.dart';

class MyCatePage extends StatefulWidget {
  MyCatePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyCatePageState createState() => _MyCatePageState();
}

class _MyCatePageState extends State<MyCatePage> {

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
              '资产1',
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed("cate_detail_page", arguments: "我是上页面传过来的参数");
              },
            )
          ],
        ),
      ),
    );
  }
}