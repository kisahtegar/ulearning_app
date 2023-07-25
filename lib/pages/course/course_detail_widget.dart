import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';

import '../../common/values/colors.dart';

/// This widget is used to display AppBar
AppBar buildAppBar() {
  return AppBar(
    title: reuseableText(
      'Course detail',
    ),
  );
}

/// This widget is used to display thumbnail image.
Widget thumbnail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage(
          'assets/icons/image_1.png',
        ),
      ),
    ),
  );
}

/// This widget is used to display menu items.
Widget menuView() {
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reuseableText(
              'Author Page',
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0),
      ],
    ),
  );
}

/// This widget is used to display icons and total numbers.
Widget _iconAndNum(String iconPath, int number) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          width: 20.w,
          height: 20.h,
          image: AssetImage(iconPath),
        ),
        reuseableText(
          number.toString(),
          color: AppColors.primaryThridElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}

/// This widget is used to display description.
Widget descriptionText() {
  return reuseableText(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    color: AppColors.primaryThridElementText,
    fontWeight: FontWeight.normal,
    fontSize: 11.sp,
  );
}

/// This widget is used to display Go Buy Button.
Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

/// This widget is used to display course summary title.
Widget courseSummaryTitle() {
  return reuseableText(
    'The Course Includes',
    fontSize: 14.sp,
  );
}

// Settings sections buttons with mapping.
var imagesInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Downloadable": "download_detail.png",
};

/// This widget is used to showing list course summary view .
Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
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

/// This widget is used to display lesson list
Widget courseLessonList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // For image and text
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/image_1.png'),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // list item title
                  _listContainer(),
                  // list item description
                  _listContainer(
                    fontSize: 10,
                    color: AppColors.primaryThridElementText,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),

          // For showing the right arrow
          Container(
            child: Image(
              height: 24.h,
              width: 24.h,
              image: AssetImage(
                'assets/icons/arrow_right.png',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// This widget is part of the `courseLessonList`.
Widget _listContainer({
  double fontSize = 13,
  Color color = AppColors.primaryText,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      'UI Design',
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
