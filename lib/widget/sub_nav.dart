import 'package:flutter/material.dart';

var subNav = [
  {"title": "WiFi电话卡", "icon": 'wifi'},
  {"title": "保险·签证", "icon": 'wifi'},
  {"title": "外币兑换", "icon": 'wifi'},
  {"title": "购物", "icon": 'wifi'},
  {"title": "当地导游", "icon": 'wifi'},
  {"title": "自由行", "icon": 'wifi'},
  {"title": "境外玩乐", "icon": 'wifi'},
  {"title": "礼品卡", "icon": 'wifi'},
  {"title": "信用卡", "icon": 'wifi'},
  {"title": "更多", "icon": 'wifi'},
];

class SubNav extends StatelessWidget {
  const SubNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // spacing: 1,  横向间隔
      // runSpacing: 1.0, 纵向间隔
      children: flexWraps(context),
    );
  }

  // 循环列表
  List<Widget> flexWraps(context) => List.generate(
      subNav.length, (index) => InkWell(
        child: Container(
          color: Colors.white,
          width: (MediaQuery.of(context).size.width / 5) - 4, // 减去间隔4 除以 5
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: [
                Icon(Icons.usb, size: 24, color: Colors.orange,),
                Text('${subNav[index]['title']}', style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          )
        ),
        onTap: (){
           print('${subNav[index]}------');
        },
      ),
  );
}