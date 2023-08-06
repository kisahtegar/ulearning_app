import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_bloc.dart';
import '../../pages/course/course_detail/bloc/course_detail_bloc.dart';
import '../../pages/course/course_detail/course_detail.dart';
import '../../pages/course/lesson/bloc/lesson_bloc.dart';
import '../../pages/course/lesson/lesson_detail.dart';
import '../../pages/course/paywebview/bloc/pay_web_view_bloc.dart';
import '../../pages/course/paywebview/pay_web_view.dart';
import '../../pages/home/bloc/home_page_bloc.dart';
import '../../pages/home/home_page.dart';
import '../../pages/profile/settings/bloc/settings_bloc.dart';
import '../../pages/profile/settings/settings_page.dart';
import '../../pages/register/bloc/register_bloc.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/welcome/welcome.dart';
import 'names.dart';

/// This `AppPages` can be used to routes our application pages.
class AppPages {
  /// This `routes()` created a lot of routes and injected our BlocProvider. So
  /// this `routes()` function returns a list of Routes with certain BLoC.
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS_PAGE,
        page: const SettingsPage(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
      PageEntity(
        route: AppRoutes.COURSE_DETAIL,
        page: const CourseDetail(),
        bloc: BlocProvider(create: (_) => CourseDetailBloc()),
      ),
      PageEntity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: const PayWebView(),
        bloc: BlocProvider(create: (_) => PayWebViewBloc()),
      ),
      PageEntity(
        route: AppRoutes.LESSON_DETAIL,
        page: const LessonDetail(),
        bloc: BlocProvider(create: (_) => LessonBloc()),
      ),
    ];
  }

  /// This method used to return all the `BlocProvider()`. This will loop bloc
  /// through the `routes()`.
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    // Loop through routes()
    for (var blocer in routes()) {
      // This will check if some PageEntity doesn't have bloc.
      if (blocer.bloc != null) {
        blocProviders.add(blocer.bloc);
      }
    }
    return blocProviders;
  }

  /// This method a modal that covers entire screen.
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    // Check for route name matching when navigator gets triggered.
    if (settings.name != null) {
      var result = routes().where(
        (element) => element.route == settings.name,
      );

      if (result.isNotEmpty) {
        debugPrint('Valid route name : ${result.first.route}');

        // Get information if this app has been opened previously or not
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        // If Welcome page has been opened previously. we will goto SignIn page.
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          // Get information if user already logged in.
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          // If user already logged in, goto ApplicationPage.
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }

        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    debugPrint('Invalid route name : ${settings.name}');
    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}

/// Unify routes, pages and BlocProvider.
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
