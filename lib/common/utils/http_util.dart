import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;

import '../../global.dart';
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
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    // the idea is whatever you pass in if there have headers use that one
    // otherwise create empty map and assign to it.
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    // this protocol talk with the server.
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    debugPrint('My status code is ${response.statusCode.toString()}');
    debugPrint('My response data is ${response.toString()}');

    // return actual data from backend.
    return response.data;
  }

  /// Getting autorization header
  Map<String, dynamic>? getAuthorizationHeader() {
    Map<String, dynamic> headers = <String, dynamic>{};
    String accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      // This means that we access Authorization and the type is Bearer token
      // Like postman GET did.
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
