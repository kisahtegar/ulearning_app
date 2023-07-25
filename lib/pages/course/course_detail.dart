import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/base_text_widget.dart';
import 'course_detail_widget.dart';

/// Implement class for Course Details Page.
class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;

  @override
  void initState() {
    super.initState();
  }

  // whenever context is available this method get called and we got value
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint(id.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 25.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First big image
                      thumbnail(),
                      SizedBox(height: 15.h),
                      // three buttons or menus
                      menuView(),
                      SizedBox(height: 15.h),
                      // course description title
                      reuseableText('Course Description'),
                      SizedBox(height: 15.h),
                      // course description
                      descriptionText(),
                      SizedBox(height: 20.h),
                      // course buy button
                      goBuyButton('Go Buy'),
                      SizedBox(height: 20.h),
                      // course summary tittle
                      courseSummaryTitle(),
                      // course summary in list
                      courseSummaryView(context),
                      SizedBox(height: 20.h),
                      // Lesson list title
                      reuseableText('Lesson List'),
                      SizedBox(height: 15.h),
                      // Course lesson list
                      courseLessonList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
