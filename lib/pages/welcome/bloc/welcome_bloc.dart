import 'package:bloc/bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

/// A Bloc responsible for managing the state of the Welcome screen.
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    // Handle WelcomeEvent to manage pages.
    on<WelcomeEvent>((event, emit) {
      emit(
        WelcomeState(
          page: state.page,
        ),
      );
    });
  }
}
