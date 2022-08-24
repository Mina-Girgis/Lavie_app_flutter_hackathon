import 'package:dio/dio.dart';
import 'package:lavie/shared/network/local/shared_pref/chache_helper.dart';

import 'end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
        // constant headers
        headers: {
          'Accept': 'application/json',
        }));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    String? token = CacheHelper.getData(key: 'token');
    return await dio!.get(
        url,
        queryParameters: query ,
        options: Options(
          headers: {
            "Authorization":"Bearer ${token}",
          }
        )
    );
  }

  // post
  // query -> parameters
  // data -> body

  static Future<Response> postData({
    required String url,
    required Map<String, String> data,
    Map<String, String>? query,
  }) {
    String? token = CacheHelper.getData(key: 'token');
    return dio!.post(
        url,
        queryParameters: query,
        data: data,
        options: Options(
            headers: {
              "Authorization":"Bearer ${token}",
            }
        )
    );
  }
}
