import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/sign_in_bloc.dart';
import 'sign_in_controller.dart';

/// Implements sign in page.
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(titleText: 'Log In'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText('Or use your email account to login'),
                    ),
                    // Group email and password.
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(height: 5.h),
                          buildTextField(
                            hintText: 'Enter your email address',
                            textType: 'email',
                            iconName: 'user',
                            onChanged: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          SizedBox(height: 5.h),
                          reusableText('Password'),
                          buildTextField(
                            hintText: 'Enter your password',
                            textType: 'password',
                            iconName: 'lock',
                            onChanged: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLogInAndRegButton(
                      buttonName: 'Log In',
                      buttonType: 'login',
                      onTap: () {
                        SignInController(context).handleSignIn('email');
                      },
                    ),
                    buildLogInAndRegButton(
                      buttonName: 'Sign Up',
                      buttonType: 'register',
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
