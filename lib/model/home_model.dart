import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/config_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config; // object 类型
  final List<CommonModel> bannerList; // list
  final List<CommonModel> localNavList; // list
  final List<CommonModel> subNavList; // list
  final GridNavModel gridNav; // object 类型
  final SalesBoxtModel salesBox;

  HomeModel({
    required this.config,
    required this.bannerList,
    required this.localNavList,
    required this.gridNav,
    required this.subNavList,
    required this.salesBox,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    // 取出数据 localNavList
    var localNavListJson = json['localNavList'] as List; // 接收并转换为list
    List<CommonModel> localNavList =
        localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    // 取出数据 bannerList
    var bannerListJson = json['bannerList'] as List; // 接收并转换为list
    List<CommonModel> bannerList =
        bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    // 取出数据 subNavList
    var subNavListJson = json['subNavList'] as List; // 接收并转换为list
    List<CommonModel> subNavList =
        subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxtModel.fromJson(json['salesBox']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localNavList'] = this.localNavList;
    data['bannerList'] = this.bannerList;
    data['subNavList'] = this.subNavList;
    data['config'] = this.config;
    data['gridNav'] = this.gridNav;
    data['salesBox'] = this.salesBox;
    return data;
  }
}
