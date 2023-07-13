part of 'app_bloc.dart';

/// Implement `AppEvent` class.
@immutable
abstract class AppEvent {
  const AppEvent();
}

/// This event used to trigger bottom navigation bar index.
@immutable
class TriggerAppEvent extends AppEvent {
  final int index;
  const TriggerAppEvent(this.index) : super();
}
