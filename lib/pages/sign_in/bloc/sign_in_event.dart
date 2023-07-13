part of 'sign_in_bloc.dart';

/// Implement `SignInEvent`.
@immutable
abstract class SignInEvent {
  const SignInEvent();
}

/// This event is used for `TextField` email.
@immutable
class EmailEvent extends SignInEvent {
  final String email;

  const EmailEvent(this.email);
}

/// This event is used for `TextField` password.
@immutable
class PasswordEvent extends SignInEvent {
  final String password;

  const PasswordEvent(this.password);
}
