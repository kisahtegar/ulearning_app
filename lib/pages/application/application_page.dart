import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'application_widgets.dart';
import 'bloc/app_bloc.dart';

/// Implement `ApplicationPage`.
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              // Body page.
              body: buildPage(appState.index),

              // Bottom navigation bar.
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  currentIndex: appState.index,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
