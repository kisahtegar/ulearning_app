import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

/// List of build page.
Widget buildPage(int index) {
  List<Widget> widgets = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];
  return widgets[index];
}

/// List of bottom tabs
List<BottomNavigationBarItem> bottomTabs = [
  BottomNavigationBarItem(
    label: 'Home',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/home.png',
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/home.png'),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/search.png',
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/search.png'),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Course',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Chat',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/message-circle.png',
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/message-circle.png'),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        'assets/icons/person2.png',
        color: AppColors.primaryElement,
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/person2.png'),
    ),
  ),
];
