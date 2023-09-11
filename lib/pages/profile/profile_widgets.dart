import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/names.dart';
import '../../common/values/colors.dart';
import '../../common/widgets/base_text_widget.dart';

/// Builds an AppBar for the profile page.
AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset('assets/icons/menu.png'),
        ),
        reuseableText('Profile'),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset('assets/icons/more-vertical.png'),
        ),
      ],
    ),
  );
}

/// Widget that displays the profile icon with an edit button.
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage(
          'assets/icons/headpic.png',
        ),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

// Settings sections buttons with mapping.
var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};

/// Builds a ListView of buttons for profile settings.
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
