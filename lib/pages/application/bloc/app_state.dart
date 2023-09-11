part of 'app_bloc.dart';

/// Represents the application's state.
///
/// An instance of [AppState] is used to store the current index of the
/// active page or screen within the application.
@immutable
class AppState {
  /// The index of the active page or screen.
  final int index;

  /// Creates a new instance of [AppState] with an optional [index] value.
  ///
  /// The [index] represents the current active page or screen index.
  const AppState({this.index = 0});
}
