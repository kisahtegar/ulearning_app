import 'package:bloc/bloc.dart';
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
}
