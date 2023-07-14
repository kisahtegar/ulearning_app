part of 'home_page_bloc.dart';

/// Implement `HomePageEvent` class.
@immutable
abstract class HomePageEvent {
  const HomePageEvent();
}

/// This event is used to change index dots view.
@immutable
class HomePageDots extends HomePageEvent {
  final int index;
  const HomePageDots(this.index);
}
