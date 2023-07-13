part of 'register_bloc.dart';

/// Implement `RegisterState`.
@immutable
class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });

  /// If your classes are `Object` are `immutable` and you want create a new `Object`,
  /// based on that the preferred recommended way to go ahead `withCopy` method.
  ///
  /// When you call `copyWith` method your constructor they should be optional
  /// named paramaters, because we using name to assign value.
  ///
  /// So it's like create new object based on older values. Remember this will
  /// takes the older `Object` first if it exists, it takes that one and copy the
  /// properties from this.
  ///
  /// releted if you want pass 1 value.
  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
