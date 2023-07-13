import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/values/constant.dart';
import '../../common/widgets/flutter_toast.dart';
import '../../global.dart';
import 'bloc/sign_in_bloc.dart';

/// This `SignInController` used to handle registration logic.
class SignInController {
  final BuildContext context;
  const SignInController(this.context);

  /// This method used to handle sign in.
  void handleSignIn(String type) async {
    try {
      // If handleSignIn type is email, then...
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        // Check state conditions.
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'Your need to fill email address.');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'Your need to fill password.');
          return;
        }

        // Try to sign in with email and password.
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          // Checking user credential.
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            // We got verified user from firebase. Then...

            // This will saving string value to the storage to indicate that
            // the user has already logged in. For now this just store dummy value.
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '123456');

            // This used to move into [ApplicationPage].
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            // We have error getting user from firebase.
            toastInfo(msg: 'Currently you are not a user of this app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          // Handle error from FirebaseAuthException.
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong.');
          }
        }
      }
    } catch (_) {
      // Implement the error/
    }
  }
}
