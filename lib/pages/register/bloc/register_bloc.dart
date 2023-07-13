import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'register_event.dart';
part 'register_state.dart';

/// Implement `RegisterBloc`
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    // Handle UserNameEvent
    on<UserNameEvent>(_userUserNameEvent);

    // Handle EmailEvent
    on<EmailEvent>(_emailEvent);

    // Handle PasswordEvent
    on<PasswordEvent>(_passwordEvent);

    // Handle RePasswordEvent
    on<RePasswordEvent>(_rePasswordEvent);
  }

  /// This used to handle `TextField` userName event
  void _userUserNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    // debugPrint('RegisterBloc[username]: ${event.userName}');
    emit(state.copyWith(userName: event.userName));
  }

  /// This used to handle `TextField` email event
  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    // debugPrint('RegisterBloc[email]: ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  /// This used to handle `TextField` password event
  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    // debugPrint('RegisterBloc[password]: ${event.password}');
    emit(state.copyWith(password: event.password));
  }

  /// This used to handle `TextField` rePassword event
  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    // debugPrint('RegisterBloc[repassword]: ${event.rePassword}');
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
