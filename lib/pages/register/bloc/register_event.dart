part of 'register_bloc.dart';

/// Implement `RegisterEvent`.
@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

/// This event is used for `TextField` username.
@immutable
class UserNameEvent extends RegisterEvent {
  final String userName;
  const UserNameEvent(this.userName);
}

/// This event is used for `TextField` email.
@immutable
class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent(this.email);
}

/// This event is used for `TextField` password.
@immutable
class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent(this.password);
}

/// This event is used for `TextField` rePassword.
@immutable
class RePasswordEvent extends RegisterEvent {
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
