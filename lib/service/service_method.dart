import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'service_url.dart';

Future getHomePageContent() async {
  try {
    print('开始请求数据');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('首页数据出现异常');
    }
  } catch (e) {
    return ('代码出现异常====${e}');
  }
}
