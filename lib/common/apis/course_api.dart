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
}
