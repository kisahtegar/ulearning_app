part of 'course_bloc.dart';

/// Implement `CourseState` class.
@immutable
class CourseState {
  const CourseState({this.courseItem});

  final CourseItem? courseItem;

  /// If your classes are `Object` are `immutable` and you want create a new `Object`,
  /// based on that the preferred recommended way to go ahead `withCopy` method.
  ///
  /// When you call `copyWith` method your constructor they should be optional
  /// named paramaters, because we using name to assign value.
  ///
  /// So it's like create new object based on older values. Remember this will
  /// takes the older `Object` first if it exists it takes that one and copy the
  /// properties from this.
  ///
  /// releted if you want pass 1 value.
  CourseState copyWith({
    CourseItem? courseItem,
  }) {
    return CourseState(
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
