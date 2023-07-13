import 'package:bloc/bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

/// Implement `WelcomeBloc`.s
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    // handle welcome event pages.
    on<WelcomeEvent>((event, emit) {
      emit(
        WelcomeState(
          page: state.page,
        ),
      );
    });
  }
}
