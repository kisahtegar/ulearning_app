import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_bloc.dart';

/// Implement `CourseDetailController` class.
class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  /// Initialize `CourseDetailController` class.
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    asyncLoadCourseData(args["id"]);
    asyncLoadLessonData(args["id"]);
  }

  /// This method used to load the course data.
  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      // means if context is available
      if (context.mounted) {
        debugPrint('---------context is ready------');
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        debugPrint('-------context is not available-------');
      }
    } else {
      toastInfo(
          msg: "Something went wrong and check the log in the laravel.log");
    }
  }

  /// This method used to go buy course.
  Future<void> goBuy(int? id) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      // make cleaner format of url / remove % from url
      var url = Uri.decodeFull(result.data!);

      var res = await Navigator.of(context).pushNamed(
        AppRoutes.PAY_WEB_VIEW,
        arguments: {"url": url},
      );

      if (res == "success") {
        toastInfo(msg: "You bought it successfully");
      }
      // print('--------my returned stripe url is $url');
    } else {
      toastInfo(msg: result.msg!);
    }
  }

  /// This method used to load the lesson data.
  asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonList(params: lessonRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerLessonList(result.data!));
        // print('my lesson list is ${result.data}');
        // print('my lesson data is ${result.data![0].thumbnail}');
      } else {
        print('----context is not read ----');
      }
    } else {
      toastInfo(msg: "Something went wrong check the log");
    }
  }
}
