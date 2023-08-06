import 'package:flutter/material.dart' show BuildContext, debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/entities.dart';
import '../../global.dart';
import 'bloc/home_page_bloc.dart';

/// Implement Home controller class.
class HomeController {
  // The singleton pattern is a pattern used in object-oriented programming which
  // ensures that a class has only one instance and also provides a global point
  // of access to it. Sometimes it's important for a class to have exactly one
  // instance, or you might force your app into a weird state. For example, you
  // only want one instance of a class that represents your local storage, or you
  // may end up with two different sources of data, which are out of sync. For
  // the same reason, an operating system should have exactly one file system.

  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();

  /// This is a factory constructor will make sure you have the original only
  /// one instance.
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  late BuildContext context;
  // Getting user profile from local storage data.
  UserItem get userProfile => Global.storageService.getUserProfile();

  /// Initialize our home controller.
  Future<void> init() async {
    // checking if token not empty. and fixing some error while logout because
    // we delete user token while logout. So, we make sure that user is logged in
    // and then make an API call.
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      debugPrint('The result is ${result.data![0].thumbnail}');

      if (result.code == 200) {
        // Fixing async gaps
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
          return;
        }
      } else {
        debugPrint(result.code.toString());
        return;
      }
    } else {
      debugPrint('User has already logged out');
    }
    return;
  }
}
