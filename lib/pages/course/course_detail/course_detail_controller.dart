import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/entities/course.dart';
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

      // var res = await Navigator.of(context)
      //     .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});

      // if (res == "success") {
      //   toastInfo(msg: "You bought it successfully");
      // }
      print('--------my returned stripe url is $url');
    } else {
      toastInfo(msg: result.msg!);
    }
  }
}