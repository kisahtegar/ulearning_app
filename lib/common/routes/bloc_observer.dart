import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

/// A custom `BlocObserver` for tracking and debugging state management in your app.
///
/// This observer provides hooks for events, transitions, changes, and errors in your
/// BLoC (Business Logic Component) architecture.
class MyGlobalObserver extends BlocObserver {
  /// Called whenever a new [event] is added to a [bloc].
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('${bloc.runtimeType} $event');
  }

  /// Called whenever a [transition] occurs in a [bloc].
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.runtimeType} $transition');
  }

  /// Called whenever a [change] occurs in a [bloc].
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }

  /// Called whenever an [error] occurs in a [bloc].
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
