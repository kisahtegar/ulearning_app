import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// Implement `SignInBloc`.
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    // Handle email event.
    on<EmailEvent>(_emailEvent);

    // Handle password event.
    on<PasswordEvent>(_passwordEvent);
  }

  /// This used to handle `TextField` email event
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // debugPrint('My email : ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  /// This used to handle `TextField` password event
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    // debugPrint('My password : ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
