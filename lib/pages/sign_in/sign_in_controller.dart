import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/apis/user_api.dart';
import '../../common/entities/entities.dart';
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
          // if user exists, then..
          if (user != null) {
            // We got verified user from firebase. Then...
            debugPrint('User exist');

            // Take users information.
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            // We creating an objects login entity.
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1; // type 1 means login with email

            // Post all objects data to database.
            asyncPostAllData(loginRequestEntity);
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

  /// Post all data user to database.
  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // First we need to show loading indicator while post data/login.
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    // Waiting for login result.
    var result = await UserApi.login(params: loginRequestEntity);

    // Check status code.
    if (result.code == 200) {
      try {
        // This will saving string value to the storage to indicate that
        // After login we able to save whole information user.
        Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(result.data!),
        );
        // This used for authorization in [HttpUtil.post()], that's why we saved
        // access token to storage.
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!, // data is null able so make not null.
        );

        // after saving data, we need to remove loading
        EasyLoading.dismiss();

        // This used to move into [ApplicationPage].
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);
      } catch (e) {
        debugPrint('Saving loccal storage error : $e');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: 'Unknown error');
    }
  }
}
