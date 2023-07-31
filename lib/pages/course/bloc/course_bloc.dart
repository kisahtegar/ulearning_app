import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../common/entities/course.dart';

part 'course_event.dart';
part 'course_state.dart';

/// Implement `CourseBloc`
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState()) {
    // Handle trigger course.
    on<TriggerCourse>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });
  }
}
