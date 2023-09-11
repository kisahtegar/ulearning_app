import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_bloc.dart';

/// The controller class for managing course details.
class CourseDetailController {
  final BuildContext context;

  /// Creates a new instance of [CourseDetailController] with the given [context].
  CourseDetailController({required this.context});

  /// Initializes the controller by loading course and lesson data.
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    asyncLoadCourseData(args["id"]);
    asyncLoadLessonData(args["id"]);
  }

  /// Loads course data asynchronously.
  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      // Check if the context is available
      if (context.mounted) {
        debugPrint('Context is ready.');
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        debugPrint('Context is not available.');
      }
    } else {
      toastInfo(msg: "Something went wrong. Check the log in the laravel.log.");
    }
  }

  /// Initiates the process to buy a course.
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
      // Clean up the URL format and remove '%'
      var url = Uri.decodeFull(result.data!);

      var res = await Navigator.of(context).pushNamed(
        AppRoutes.PAY_WEB_VIEW,
        arguments: {"url": url},
      );

      if (res == "success") {
        toastInfo(msg: "You bought it successfully.");
      }
      // print('--------my returned stripe url is $url');
    } else {
      debugPrint("Statement");
      toastInfo(msg: result.msg!);
    }
  }

  /// Loads lesson data asynchronously.
  asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var resultLesson = await LessonAPI.lessonList(params: lessonRequestEntity);
    var resultPay = await CourseAPI.coursePay(params: courseRequestEntity);
    if (resultPay.msg != "You already bought this course") {
      context.read<CourseDetailBloc>().add(const TriggerCheckBuy(false));
    }
    if (resultPay.msg == "You already bought this course") {
      context.read<CourseDetailBloc>().add(const TriggerCheckBuy(true));
    }

    if (resultLesson.code == 200) {
      if (context.mounted) {
        context
            .read<CourseDetailBloc>()
            .add(TriggerLessonList(resultLesson.data!));
        // print('my lesson list is ${result.data}');
        // print('my lesson data is ${result.data![0].thumbnail}');
      } else {
        debugPrint('Context is not ready.');
      }
    } else {
      toastInfo(msg: "Something went wrong. Check the log.");
    }
  }
}
