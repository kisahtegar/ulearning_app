part of 'lesson_bloc.dart';

/// Implement `LessonEvent` class.
@immutable
abstract class LessonEvent {
  const LessonEvent();
}

/// This event is used to trigger lesson video.
@immutable
class TriggerLessonVideo extends LessonEvent {
  final List<LessonVideoItem> lessonVideoItem;
  const TriggerLessonVideo(this.lessonVideoItem);
}

/// This event is used to trigger URL video.
@immutable
class TriggerUrlItem extends LessonEvent {
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture);
}

/// This event is used to trigger play video.
@immutable
class TriggerPlay extends LessonEvent {
  final bool isPlay;
  const TriggerPlay(this.isPlay);
}
