import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

/// Builds a widget based on the given index.
///
/// The [index] determines which widget to build and return.
Widget buildPage(int index) {
  // Define a list of widgets corresponding to different pages.
  List<Widget> widgets = [
    const HomePage(),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const ProfilePage(),
  ];

  // Return the widget based on the provided index.
  return widgets[index];
}

/// List of bottom navigation bar items.
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
    label: 'ProfilePage',
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
