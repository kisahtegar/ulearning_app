import 'package:flutter/cupertino.dart' show debugPrint;

import '../entities/entities.dart';
import '../utils/http_util.dart';

/// This endpoint for Course API
class CourseAPI {
  /// `/courseList` endpoint that used to get course list.
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    debugPrint(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  /// `/courseDetail` endpoint that used to get course detail.
  static Future<CourseDetailResponseEntity> courseDetail({
    CourseRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params?.toJson(),
    );
    // debugPrint(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  /// `/checkout` endpoint that used for course payment.
  static Future<BaseResponseEntity> coursePay({
    CourseRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),
    );
    // debugPrint(response.toString());
    return BaseResponseEntity.fromJson(response);
  }
}
