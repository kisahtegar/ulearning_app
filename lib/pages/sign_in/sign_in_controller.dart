import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/pages/home/home_controller.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/entities.dart';
import '../../common/values/constant.dart';
import '../../common/widgets/flutter_toast.dart';
import '../../global.dart';
import 'bloc/sign_in_bloc.dart';

/// The `SignInController` class handles sign-in logic and user authentication.
class SignInController {
  final BuildContext context;
  const SignInController(this.context);

  /// Handles the sign-in process based on the provided `type` (e.g., email).
  void handleSignIn(String type) async {
    try {
      // If the sign-in type is email...
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        // Check if email and password are not empty.
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'You need to fill in your email address.');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill in your password.');
          return;
        }

        // Attempt to sign in with email and password.
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          // Check user credential.
          if (credential.user == null) {
            toastInfo(msg: "User does not exist.");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email account.');
            return;
          }

          var user = credential.user;

          // If user exists...
          if (user != null) {
            // We got verified user from firebase. Then...
            debugPrint('User exist');

            // Retrieve user information.
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            // Create a login request entity.
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1; // Type 1 means login with email

            // Post user data to the database.
            await asyncPostAllData(loginRequestEntity);

            // Initialize the HomeController.
            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            // Error retrieving user from Firebase.
            toastInfo(msg: 'You are not a user of this app.');
            return;
          }
        } on FirebaseAuthException catch (e) {
          // Handle FirebaseAuthException errors.
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Invalid email format.');
          }
        }
      }
    } catch (_) {
      // Handle errors.
    }
  }

  /// Posts user data to the database.
  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // Show loading indicator while posting data.
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    // Wait for the login result.
    var result = await UserApi.login(params: loginRequestEntity);

    // Check the status code.
    if (result.code == 200) {
      try {
        // Save user profile data to local storage.
        Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.data!),
        );

        // Save access token to local storage for authorization.
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!, // Data is nullable, so make it non-null.
        );

        // Dismiss loading indicator.
        EasyLoading.dismiss();

        // Navigate to the ApplicationPage.
        // Fixing async gaps
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/application", (route) => false);
        }
      } catch (e) {
        debugPrint('Error saving local storage: $e');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'Unknown error');
    }
  }
}
