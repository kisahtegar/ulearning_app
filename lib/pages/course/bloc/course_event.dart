part of 'course_bloc.dart';

/// Implement `CourseEvent` class.
@immutable
abstract class CourseEvent {
  const CourseEvent();
}

/// This event used to trigger course.
@immutable
class TriggerCourse extends CourseEvent {
  const TriggerCourse(this.courseItem);
  final CourseItem courseItem;
}
