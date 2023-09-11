import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/colors.dart';

/// Creates a customized AppBar for the Ulearning App.
///
/// The AppBar can display a title and a separator line at the bottom.
/// [titleText] is an optional parameter to specify the title text.
AppBar buildAppBar({String? titleText}) {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0, // Defines the thickness of the separator line.
      ),
    ),
    title: Text(
      titleText ?? '',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

/// Builds a row of third-party login icons.
///
/// Requires the [BuildContext] for accessing Bloc.
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reuseableIcons('google'),
        _reuseableIcons('apple'),
        _reuseableIcons('facebook'),
      ],
    ),
  );
}

/// Returns a GestureDetector with an icon for a specific third-party login option.
///
/// The [iconName] parameter specifies the name of the icon to be displayed.
GestureDetector _reuseableIcons(String iconName) {
  return GestureDetector(
    onTap: () {
      // Handle the tap event for the icon.
    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

/// Creates a reusable text widget with specified styles.
///
/// [text] is the text to be displayed.
Widget reuseableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

/// Builds a customized TextField widget with optional parameters.
///
/// - The [hintText] parameter sets the hint text for the TextField.
/// - The [textType] parameter is used to specify the type of text input.
/// - The [iconName] parameter specifies the name of the icon to be displayed.
/// - The [onChanged] callback function is called when the text changes.
Widget buildTextField({
  String? hintText,
  String? textType,
  String? iconName,
  void Function(String value)? onChanged,
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourthElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => onChanged!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

/// Displays a "Forgot Password" text widget.
Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {
        // Handle the "Forgot Password" action.
      },
      child: Text(
        'Forgot Password',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

/// Builds a login or registration button with specified parameters.
///
/// The [buttonName] parameter sets the button's text.
/// The [buttonType] parameter specifies the type of button (login or registration).
/// The [onTap] callback function is called when the button is tapped.
Widget buildLogInAndRegButton({
  required String buttonName,
  required String buttonType,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: buttonType == 'login' ? 40.h : 20.h,
      ),
      decoration: BoxDecoration(
        color: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType == 'login'
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
