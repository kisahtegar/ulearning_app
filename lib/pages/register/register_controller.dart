import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/flutter_toast.dart';
import 'bloc/register_bloc.dart';

/// This `RegisterController` used to handle registration logic.
class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  /// Handle the registration email and password.
  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // Check state conditions.
    if (userName.isEmpty) {
      toastInfo(msg: 'Username cannot be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }

    // Try to create a new user.
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // When success create user, send email verification.
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
          msg:
              'An email has been sent to your registered email. To activate it please check your email box',
        );
        Navigator.of(context).pop(); // Pop from SignUp page.
      }
    } on FirebaseAuthException catch (e) {
      // Handle error from FirebaseAuthException.
      if (e.code == 'week-password') {
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email ID is invalid');
      }
    } catch (_) {
      // We can implement this error.
    }
  }
}
