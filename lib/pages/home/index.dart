import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_app/widget/grid_nav.dart';
import 'package:flutter_app/widget/local_nav.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 顶部导航的图片
  List _imageUrls = [
    "https://img0.baidu.com/it/u=192503985,3356094582&fm=26&fmt=auto&gp=0.jpg",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20180620%2F34adbbb8b3bf449888f19384e8c293bc.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628760300&t=0ba908eb5e34182457848fa9d5f229b7",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fstatic-xiaoguotu.17house.com%2Fxgt%2Fm%2F01%2F146272724015.jpg&refer=http%3A%2F%2Fstatic-xiaoguotu.17house.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1628760300&t=9872b612c42ce099af4f5ce209f7e675"
  ];

  @override
  void initState() {
    super.initState();
    // 默认加载首页的数据
    loadData();
  }

  // 监听页面滚动
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / 100; // 100 滚动100时开始渐变
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  // 首页数据的JSON
  String resultString = "home modal";

  // 顶部自定义导航栏(5个)
  List<CommonModel> localNavList = [];

  loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(model);
        localNavList = model.localNavList;
      });
    } catch (e) {
      setState(() {
        resultString = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        // 后面元素在上层，前面元素在下层
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                // 页面滚动的监听
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    // 滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(
                  children: [
                    Container(
                      height: 180,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                      child: LocalNav(localNavList: localNavList),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                      child: GridNavBox(),
                    ),
                    Text(resultString),
                  ],
                ),
              )),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("首页", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
