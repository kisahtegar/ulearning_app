import '../entities/entities.dart';
import '../utils/http_util.dart';

/// A class for handling Lesson-related API endpoints.
class LessonAPI {
  /// Fetches a list of lessons.
  ///
  /// - [params] : The request parameters for the lesson list.
  ///
  /// Returns a [LessonListResponseEntity] containing the list of lessons.
  static Future<LessonListResponseEntity> lessonList({
    LessonRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/lessonList',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }

  /// Fetches detailed information about a specific lesson.
  ///
  /// [params] - The request parameters for the lesson detail.
  ///
  /// Returns a [LessonDetailResponseEntity] with detailed lesson information.
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
