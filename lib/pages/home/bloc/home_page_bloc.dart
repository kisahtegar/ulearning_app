import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../../common/entities/entities.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

/// Implement `HomePageBloc`.
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    // Handle dots slider events.
    on<HomePageDots>((event, emit) {
      emit(state.copyWith(index: event.index));
    });

    // Handle course item event.
    on<HomePageCourseItem>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });
  }
}
