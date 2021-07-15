import 'package:flutter/material.dart';

const CITY_NAMES = ['北京', '上海', '广州', '杭州', '南京', '深圳', '山东'];

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
      body: ListView(
        children: _buildListItem(),
      )
    );
  }

  // 列表渲染
  List<Widget> _buildListItem(){
    return CITY_NAMES.map((city) => _renderItem(city)).toList();
  }

  Widget _renderItem(city){
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(city, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }

}