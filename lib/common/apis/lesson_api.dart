import '../entities/entities.dart';
import '../utils/http_util.dart';

/// This endpoint for Lesson API
class LessonAPI {
  /// `/lessonList` endpoint that used to get lesson list.
  static Future<LessonListResponseEntity> lessonList({
    LessonRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/lessonList',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }

  /// `/lessonDetail` endpoint that used to get lesson detail.
  static Future<LessonDetailResponseEntity> lessonDetail({
    LessonRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/lessonDetail',
      queryParameters: params?.toJson(),
    );
    // print(response.toString());
    return LessonDetailResponseEntity.fromJson(response);
  }
}
