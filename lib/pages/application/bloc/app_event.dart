part of 'app_bloc.dart';

/// Represents an abstract base class for events related to the application.
@immutable
abstract class AppEvent {
  const AppEvent();
}

/// An event used to trigger changes in the bottom navigation bar index.
///
/// The [index] parameter specifies the new index to set in the navigation bar.
@immutable
class TriggerAppEvent extends AppEvent {
  /// The index to be triggered in the bottom navigation bar.
  final int index;

  /// Creates a [TriggerAppEvent] with the specified [index].
  ///
  /// This event is used to change the active index in the bottom navigation bar.
  const TriggerAppEvent(this.index) : super();
}
