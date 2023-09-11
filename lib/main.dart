import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';
import 'common/values/colors.dart';
import 'global.dart';

/// The main entry point for the Ulearning App.
void main() async {
  // Initialize global configurations and settings.
  await Global.init();

  // Run the main application.
  runApp(const App());
}

/// The root widget of the Ulearning App.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        // Initialize screen adaptation settings.
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(), // Initialize loading indicator.
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
