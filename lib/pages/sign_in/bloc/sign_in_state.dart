part of 'sign_in_bloc.dart';

/// The `SignInState` class represents the state of the sign-in form.
@immutable
class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = "",
    this.password = "",
  });

  /// If your classes are `Object` are `immutable` and you want create a new `Object`,
  /// based on that the preferred recommended way to go ahead `withCopy` method.
  ///
  /// When you call `copyWith` method your constructor they should be optional
  /// named paramaters, because we using name to assign value.
  ///
  /// So it's like create new object based on older values. Remember this will
  /// takes the older `Object` first if it exists it takes that one and copy the
  /// properties from this.
  ///
  /// releted if you want pass 1 value.
  SignInState copyWith({
    // Optional named parameters.
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
