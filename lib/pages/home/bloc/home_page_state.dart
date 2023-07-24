part of 'home_page_bloc.dart';

/// Implement `HomePageState` class.
@immutable
class HomePageState {
  const HomePageState({
    this.index = 0,
    this.courseItem = const <CourseItem>[],
  });

  final int index;
  final List<CourseItem> courseItem;

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
  HomePageState copyWith({
    int? index,
    List<CourseItem>? courseItem,
  }) {
    return HomePageState(
      index: index ?? this.index,
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
