import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'app_event.dart';
part 'app_state.dart';

/// The business logic component for managing application state.
///
/// The [AppBloc] is responsible for handling events that affect the
/// application's overall state, such as changes to the bottom navigation bar's
/// active index.
class AppBloc extends Bloc<AppEvent, AppState> {
  /// Creates an instance of [AppBloc] with an initial [AppState].
  AppBloc() : super(const AppState()) {
    // This method is used to handle events related to changing the active index
    // in the bottom navigation bar.
    on<TriggerAppEvent>((event, emit) {
      // Debugging: Uncomment the line below to print the page index for debugging.
      // debugPrint('Page Index: ${event.index}');
      emit(AppState(index: event.index));
    });
  }
}
