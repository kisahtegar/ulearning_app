import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/flutter_toast.dart';
import 'bloc/register_bloc.dart';

/// The `RegisterController` class handles registration logic for the sign-up process.
class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  /// Handles user registration using email and password.
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
    if (rePassword.isEmpty || password != rePassword) {
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

      // When successfully creating a user, additional steps are required...
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        // Default photo from the server.
        String photoUrl = 'uploads/default.png';
        await credential.user?.updatePhotoURL(photoUrl); // Update photo URL

        toastInfo(
          msg:
              'An email has been sent to your registered email. To activate your account, please check your email inbox',
        );

        Navigator.of(context).pop(); // Pop from SignUp page.
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors from FirebaseAuthException.
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email ID is invalid');
      }
    } catch (_) {
      // Implement error handling logic here.
    }
  }
}
