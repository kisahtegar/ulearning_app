import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/entities.dart';
import '../../common/routes/routes.dart';
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
  // late HomeController _homeController;
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    // Initialize the home controller
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile.avatar.toString()),
      body: RefreshIndicator(
        onRefresh: () {
          return HomeController(context: context).init();
        },
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, homePageState) {
            // debugPrint('Check my status state : ${homePageState.courseItem}');
            // Checking state.courseItem because when we restart our application
            // the data will be clear.
            if (homePageState.courseItem.isEmpty) {
              // debugPrint('[HomePage]: homePageState.courseItem is empty');
              HomeController(context: context).init();
            } else {
              // debugPrint('[HomePage]: homePageState.courseItem is not empty');
            }
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
                      userProfile.name ?? "",
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
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.COURSE_DETAIL,
                                arguments: {
                                  "id": homePageState.courseItem
                                      .elementAt(index)
                                      .id
                                },
                              );
                            },
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
      ),
    );
  }
}
