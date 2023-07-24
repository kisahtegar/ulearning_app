import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:ulearning_app/common/utils/http_util.dart';

/// This endpoint for Course API
class CourseAPI {
  /// `/courseList` endpoint that used to get course list.
  static courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    debugPrint(response.toString());
  }
}
