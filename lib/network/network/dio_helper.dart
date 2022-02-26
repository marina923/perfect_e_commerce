import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://162.240.24.203/~tohome/system/api',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // String url is a variable to store the method in the url
  static Future<Response> getData({
    required String url,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $token',
    };
    return await dio!.get(
      url,

    );
  }

  static Future<Response> postData({
    required String url,
    required Map data,
    String lang = 'en',
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
    };
    return await dio!.post(
      url,
      data: data,
    );
  }
}