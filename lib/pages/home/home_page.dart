import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/home_page_bloc.dart';
import 'home_controller.dart';
import 'home_page_widgets.dart';

/// Implement home page.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    // Initialize the home controller
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    // the first things we need to check userProfile is null or not.
    return _homeController.userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(_homeController.userProfile!.avatar.toString()),
            body: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, homePageState) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText(
                          'Hello',
                          colorText: AppColors.primaryThridElementText,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(
                          _homeController.userProfile!.name!,
                          top: 5,
                        ),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, homePageState),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18.h,
                          horizontal: 0.w,
                        ),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.6,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            childCount: homePageState.courseItem.length,
                            (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: courseGrid(
                                  homePageState.courseItem[index],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
