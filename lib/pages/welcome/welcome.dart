import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../../common/values/constant.dart';
import '../../global.dart';
import 'bloc/welcome_bloc.dart';

/// Welcome page that provides an introduction to the app.
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, welcomeState) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      welcomeState.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _buildPage(
                        context: context,
                        index: 1,
                        imagePath: 'assets/images/reading.png',
                        title: 'First Learning',
                        subTitle:
                            'Forget about a for of paper all knowledge in one learning',
                        buttonName: 'Next',
                      ),
                      _buildPage(
                        context: context,
                        index: 2,
                        imagePath: 'assets/images/boy.png',
                        title: 'Connect With Everyone',
                        subTitle:
                            'Always keep in touch with your tutor & friends. Lets get connected.',
                        buttonName: 'Next',
                      ),
                      _buildPage(
                        context: context,
                        index: 3,
                        imagePath: 'assets/images/man.png',
                        title: 'Always Fascinated Learning',
                        subTitle:
                            'Anywhere, anytime. The time is at your discretion so study whatever you want.',
                        buttonName: 'Get Started',
                      ),
                    ],
                  ),
                  // Dots indicator
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: welcomeState.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThridElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds a dynamic page.
  Column _buildPage({
    required BuildContext context,
    required int index,
    required String imagePath,
    required String title,
    required String subTitle,
    required String buttonName,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.2, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Within 0-2
            if (index < 3) {
              // Animation to the next page
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              debugPrint(
                'The value is ${Global.storageService.getDeviceFirstOpen()}',
              );

              // When app opens for the first time, save the value to indicate
              // that the user has already opened the welcome page.
              Global.storageService.setBool(
                AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME,
                true,
              );

              // Navigate to a new page and remove the previous pages from the stack.
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/sign_in',
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
