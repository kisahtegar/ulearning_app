import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../../common/entities/entities.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

/// Implement `CourseDetailBloc` class.
class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    // Handle trigger detail course.
    on<TriggerCourseDetail>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });

    // Handle trigger lesson list.
    on<TriggerLessonList>((event, emit) {
      emit(state.copyWith(lessonItem: event.lessonItem));
    });

    // Handle trigger lesson list.
    on<TriggerCheckBuy>((event, emit) {
      emit(state.copyWith(checkBuy: event.checkBuy));
    });
  }
}
