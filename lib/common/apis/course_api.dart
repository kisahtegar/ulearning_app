import 'package:flutter/cupertino.dart' show debugPrint;

import '../entities/entities.dart';
import '../utils/http_util.dart';

/// A class for handling Course-related API endpoints.
class CourseAPI {
  /// Fetches the list of courses.
  ///
  /// Returns a [CourseListResponseEntity] containing the course list.
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    debugPrint(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  /// Fetches detailed information about a specific course.
  ///
  /// [params] - The request parameters for the course detail.
  ///
  /// Returns a [CourseDetailResponseEntity] with detailed course information.
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

  /// Initiates payment for a course.
  ///
  /// [params] - The request parameters for course payment.
  ///
  /// Returns a [BaseResponseEntity] indicating the payment status.
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
