import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint;

import '../../global.dart';
import '../values/constant.dart';

/// A utility class for making HTTP requests to the server.
class HttpUtil {
  // Singleton instance of HttpUtil
  static final HttpUtil _instance = HttpUtil._internal();

  /// Factory constructor for creating a singleton instance of HttpUtil.
  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  /// Initializes the HttpUtil with default options.
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );
    // Initialize Dio with the provided options
    dio = Dio(options);
  }

  /// Sends an HTTP POST request to the server.
  ///
  /// - [path] - The API endpoint path.
  /// - [data] - The request body data.
  /// - [queryParameters] - Query parameters to be included in the request.
  /// - [options] - Additional options for the request.
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    // If headers are not provided, initialize an empty map.
    requestOptions.headers = requestOptions.headers ?? {};

    // Add authorization header if available.
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    // Send the POST request to the server.
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    // Debug print status code and response data.
    debugPrint('HTTP Status Code: ${response.statusCode.toString()}');
    debugPrint('Response Data: ${response.toString()}');

    // Return the actual data received from the backend.
    return response.data;
  }

  /// Gets the authorization header containing the user access token.
  Map<String, dynamic>? getAuthorizationHeader() {
    Map<String, dynamic> headers = <String, dynamic>{};
    String accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      // Include the user access token in the Authorization header.
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
