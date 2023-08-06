part of 'lesson_bloc.dart';

/// Implement `LessonState` class.
@immutable
class LessonState {
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;

  const LessonState({
    this.lessonVideoItem = const <LessonVideoItem>[],
    this.isPlay = false,
    this.initializeVideoPlayerFuture,
  });

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
  LessonState copyWith({
    List<LessonVideoItem>? lessonVideoItem,
    bool? isPlay,
    Future<void>? initializeVideoPlayerFuture,
    int? videoIndex,
  }) {
    return LessonState(
      lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
      isPlay: isPlay ?? this.isPlay,
      initializeVideoPlayerFuture:
          initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
    );
  }
}
