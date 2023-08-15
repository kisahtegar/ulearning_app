part of 'course_detail_bloc.dart';

/// Implement `CourseDetailEvent` class.
@immutable
abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

/// This event used to trigger course detail.
@immutable
class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem);
  final CourseItem courseItem;
}

/// This event used to trigger lesson list.
@immutable
class TriggerLessonList extends CourseDetailEvent {
  const TriggerLessonList(this.lessonItem);
  final List<LessonItem> lessonItem;
}

/// This event used to trigger check buy.
@immutable
class TriggerCheckBuy extends CourseDetailEvent {
  const TriggerCheckBuy(this.checkBuy);
  final bool checkBuy;
}
