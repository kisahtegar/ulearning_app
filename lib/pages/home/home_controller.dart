import 'package:flutter/material.dart' show BuildContext, debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/entities.dart';
import '../../global.dart';
import 'bloc/home_page_bloc.dart';

/// Implement Home controller class.
class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  // Getting user profile from local storage data.
  UserItem? userProfile = Global.storageService.getUserProfile();

  /// Initialize our home controller.
  void init() async {
    // checking if token not empty. and fixing some error while logout because
    // we delete user token while logout. So, we make sure that user is logged in
    // and then make an API call.
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();

      if (result.code == 200) {
        // Fixing async gaps
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
        }
      } else {
        debugPrint(result.code.toString());
      }
    } else {
      debugPrint('User has already logged out');
    }
  }
}
