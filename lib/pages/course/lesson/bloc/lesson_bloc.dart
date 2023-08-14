import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../../common/entities/entities.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

/// Implement `LessonBloc` class.
class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(const LessonState()) {
    on<TriggerLessonVideo>(_triggerLessonVideo);
    on<TriggerUrlItem>(_triggerUrlItem);
    on<TriggerPlay>(_triggerPlay);
    on<TriggerVideoIndex>(_triggerVideoIndex);
  }

  /// Handler events for lesson video.
  void _triggerLessonVideo(
    TriggerLessonVideo event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lessonVideoItem: event.lessonVideoItem));
  }

  /// Handler events for trigger url video.
  void _triggerUrlItem(
    TriggerUrlItem event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(
        initializeVideoPlayerFuture: event.initVideoPlayerFuture));
  }

  /// Handler events for trigger play video.
  void _triggerPlay(
    TriggerPlay event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(isPlay: event.isPlay));
  }

  /// Handler events for trigger video index.
  void _triggerVideoIndex(
    TriggerVideoIndex event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(videoIndex: event.videoIndex));
  }
}
