part of 'lesson_bloc.dart';

/// Implement `LessonEvent` class.
@immutable
abstract class LessonEvent {
  const LessonEvent();
  List<Object?> get props => [];
}

/// This event is used to trigger lesson video.
@immutable
class TriggerLessonVideo extends LessonEvent {
  final List<LessonVideoItem> lessonVideoItem;
  const TriggerLessonVideo(this.lessonVideoItem);

  @override
  List<Object?> get props => [lessonVideoItem];
}

/// This event is used to trigger URL video.
@immutable
class TriggerUrlItem extends LessonEvent {
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture);

  @override
  List<Object?> get props => [initVideoPlayerFuture];
}

/// This event is used to trigger play video.
@immutable
class TriggerPlay extends LessonEvent {
  final bool isPlay;
  const TriggerPlay(this.isPlay);

  @override
  List<Object?> get props => [isPlay];
}

/// This event is used to trigger video index.
@immutable
class TriggerVideoIndex extends LessonEvent {
  final int videoIndex;
  const TriggerVideoIndex(this.videoIndex);

  @override
  List<Object?> get props => [videoIndex];
}
