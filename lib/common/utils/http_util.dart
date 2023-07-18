import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;

import '../values/constant.dart';

class HttpUtil {
  // singleton class
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;

  /// This basic requirement to talk with server
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    // initialize dio
    dio = Dio(options);
  }

  /// Post all data user to the server.
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    // this protocol talk with the server.
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    debugPrint('My response data is ${response.toString()}');
    debugPrint('My status code is ${response.statusCode.toString()}');

    // return actual data from backend.
    return response.data;
  }
}
