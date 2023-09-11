import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Displays a toast message with customizable appearance.
///
/// Use this function to show informative messages in a toast format.
///
/// - [msg]: The message text to display.
/// - [backgroundColor]: The background color of the toast (default is black).
/// - [textColor]: The text color of the message (default is white).
toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}
