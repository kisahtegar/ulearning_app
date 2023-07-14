import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_bloc.dart';
import 'register_controller.dart';

// Implement register page.
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(titleText: 'Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: reuseableText(
                        'Enter your details below and free sign up',
                      ),
                    ),
                    // Group email and password.
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText('Username'),
                          buildTextField(
                            hintText: 'Enter your username',
                            textType: 'name',
                            iconName: 'user',
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(value));
                            },
                          ),
                          reuseableText('Email'),
                          buildTextField(
                            hintText: 'Enter your email address',
                            textType: 'email',
                            iconName: 'user',
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reuseableText('Password'),
                          buildTextField(
                            hintText: 'Enter your password',
                            textType: 'password',
                            iconName: 'lock',
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reuseableText('Confirm Password'),
                          buildTextField(
                            hintText: 'Re-enter your password to confirm',
                            textType: 'password',
                            iconName: 'lock',
                            onChanged: (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RePasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reuseableText(
                        'By creating an account you have to agree with our terms and conditions',
                      ),
                    ),
                    buildLogInAndRegButton(
                      buttonName: 'Sign Up',
                      buttonType: 'login',
                      onTap: () {
                        RegisterController(context).handleEmailRegister();
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
