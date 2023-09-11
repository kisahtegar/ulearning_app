import 'package:flutter/material.dart' show BuildContext, debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/entities.dart';
import '../../global.dart';
import 'bloc/home_page_bloc.dart';

/// The `HomeController` class handles the initialization and data retrieval
/// for the home page.
///
/// It follows the singleton pattern to ensure there is only one instance of
/// this controller throughout the app.
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

  /// Gets the user profile from local storage data.
  UserItem get userProfile => Global.storageService.getUserProfile();

  /// Initializes the home controller and fetches data.
  Future<void> init() async {
    // Check if the user token is not empty.
    if (Global.storageService.getUserToken().isNotEmpty) {
      // Make an API call to fetch course data.
      var result = await CourseAPI.courseList();
      debugPrint('The result is ${result.data![0].thumbnail}');

      if (result.code == 200) {
        // Ensure the context is still mounted before emitting events to the bloc.
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
