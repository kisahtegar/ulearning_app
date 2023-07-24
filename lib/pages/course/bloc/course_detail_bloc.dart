import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../common/entities/course.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    // Handle trigger detail course.
    on<TriggerCourseDetail>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });
  }
}
