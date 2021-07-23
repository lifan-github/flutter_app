import 'package:flutter/material.dart';

var gridNavList = {
  'hotel': {
    'startColor': 'fa5956',
    'endColor': 'fa9b4d',
    'mainItem': {
      'title': '酒店',
      'icon': 'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png',
      'url': 'https://m.ctrip.com/webapp/hotel/',
      'statusBarColor': '4289ff'
    },
    'item1': {
      'title': '海外酒店',
      'url': 'https://m.ctrip.com/webapp/hotel/oversea/?otype=1',
      'statusBarColor': '4289ff'
    },
    'item2': {
      'title': '特价酒店',
      'url': 'https://m.ctrip.com/webapp/hotel/hotsale',
    },
    'item3': {
      'title': '爆款',
      'url': 'https://m.ctrip.com/webapp/cw/gs/onsale/boomHome.html',
      'hideAppBar': true
    },
    'item4': {
      'title': '名宿·客栈',
      'url': 'https://m.ctrip.com/webapp/inn/index',
      'hideAppBar': true
    },
  },
  'flight': {
    'startColor': '4b8fed',
    'endColor': '53bced',
    'mainItem': {
      'title': '机票',
      'icon': 'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png',
      'url': 'https://m.ctrip.com/html5/flight/swift/index',
    },
    'item1': {
      'title': '火车票',
      'url': 'https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539',
      'hideAppBar': true
    },
    'item2': {
      'title': '特价机票',
      'url': 'https://m.ctrip.com/html5/flight/swift/index',
    },
    'item3': {
      'title': '汽车票·船票',
      'url': 'https://m.ctrip.com/webapp/bus/',
      'hideAppBar': true
    },
    'item4': {
      'title': '专车·租车',
      'url': 'https://m.ctrip.com/webapp/cw/car/home/index.html',
      'hideAppBar': true
    },
  },
  'travel': {
    'startColor': '34c2aa',
    'endColor': '6cd557',
    'mainItem': {
      'title': '旅游',
      'icon': 'https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png',
      'url': 'https://m.ctrip.com/webapp/vacations/tour/vacations',
      'hideAppBar': true,
      'statusBarColor': '19A0F0'
    },
    'item1': {
      'title': '门票',
      'url': 'https://m.ctrip.com/tangram/ticket?ctm_ref=vactang_page_8349&isHideNavBar=YES&coords=1&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
      'statusBarColor': '19A0F0',
      'hideAppBar': true,
    },
    'item2': {
      'title': '目的地攻略',
      'url': 'https://m.ctrip.com/webapp/you/gsdestination/place/2.html?seo=0&ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
      'statusBarColor': '19A0F0',
      'hideAppBar': true,
    },
    'item3': {
      'title': '私家团',
      'url': 'https://m.ctrip.com/tangram/minitour?isHideNavBar=YES&ctm_ref=vactang_page_800&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
      'hideAppBar': true
    },
    'item4': {
      'title': '定制旅行',
      'url': 'https://m.ctrip.com/webapp/vacations/dingzhi/index?ctm_ref=C_vac_custom&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
      'hideAppBar': true
    },
  }
};

class GridNavBox extends StatelessWidget {
  const GridNavBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _gridNavItems(context, gridNavList['hotel'], 'start'),
        _gridNavItems(context, gridNavList['flight'], 'mid'),
        _gridNavItems(context, gridNavList['travel'], 'end'),
      ],
    );
  }

  _gridNavItems(context, item, border) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(bottom: 2.5),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(item['mainItem']['title'], style: TextStyle(color: Colors.white, fontSize: 18),),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.network(item['mainItem']['icon']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  print('${item['mainItem']}');
                },
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              right: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                            )
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(item['item1']['title'], style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      ),
                      onTap: (){
                        print('${item["item1"]}');
                      },
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              right: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                            )
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(item['item2']['title'], style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      ),
                      onTap: (){
                        print('${item["item2"]}');
                      },
                    )
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                            )
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(item['item3']['title'], style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      ),
                      onTap: (){
                        print('${item["item3"]}------------');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(item['item4']['title'], style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      ),
                      onTap: (){
                        print('${item["item4"]}------------');
                      },
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(int.parse("0xff${item['startColor']}")), Color(int.parse("0xff${item['endColor']}"))],
            tileMode: TileMode.mirror
        ),
        borderRadius: BorderRadius.only(
          topLeft: border == 'start' ? Radius.circular(4.0) : Radius.circular(0.0),
          topRight: border == 'start' ? Radius.circular(4.0) : Radius.circular(0.0),
          bottomLeft: border == 'end' ? Radius.circular(4.0) : Radius.circular(0.0),
          bottomRight: border == 'end' ? Radius.circular(4.0) : Radius.circular(0.0),
        ),
      ),
    );
  }
}
