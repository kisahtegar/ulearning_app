import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'app_event.dart';
part 'app_state.dart';

/// This `AppBloc` used to handle events from app
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    // This used to handle event index [buildPage] / bottom navigation bar.
    on<TriggerAppEvent>((event, emit) {
      // debugPrint('Page Index: ${event.index}'); // For debugging.
      emit(AppState(index: event.index));
    });
  }
}
