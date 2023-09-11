import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

/// A reusable text widget with customizable properties.
///
/// Use this widget to create consistent text styles throughout the app.
///
/// - [text]: The text to display.
/// - [color]: The color of the text (default is [AppColors.primaryText]).
/// - [fontSize]: The font size of the text (default is 16).
/// - [fontWeight]: The font weight of the text (default is [FontWeight.bold]).
Widget reuseableText(
  String text, {
  Color color = AppColors.primaryText,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}
