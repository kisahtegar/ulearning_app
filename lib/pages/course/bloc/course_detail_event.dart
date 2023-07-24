part of 'course_detail_bloc.dart';

///
@immutable
abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

///
@immutable
class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem);
  final CourseItem courseItem;
}
