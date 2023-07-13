import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// This custom widget used to showing message toast information.
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
