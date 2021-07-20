import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/home_model.dart';

const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(Uri.parse(HOME_URL));
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder(); // 修复中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception("加载JSON接口失败");
    }
  }
}