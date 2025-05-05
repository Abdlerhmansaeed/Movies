import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/features/browse/presentation/pages/categroies_browes_screen.dart';
import 'package:movies/features/home/presentation/pages/home_screen.dart';
import 'package:movies/features/layout/app_manger/app_cubit.dart';
import 'package:movies/features/layout/app_manger/app_states.dart';
import 'package:movies/features/profile/presentation/pages/profile_screen.dart';
import 'package:movies/features/search/presentation/pages/search_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      CategroiesBrowesScreen(),
      ProfileScreen(),
    ];

    Color getIconColor(int index, int currentIndex) {
      return index == currentIndex ? AppColors.yellow : Colors.white;
    }

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.bottomNavBarIndex],
          bottomNavigationBar: Container(
            height: 61.h,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.darkGray,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  enableFeedback: false,
                  currentIndex: state.bottomNavBarIndex,
                  onTap: (int index) {
                    context.read<AppCubit>().changeBottomNavBarIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Center(
                        child: Icon(
                          Icons.home_rounded,
                          color: getIconColor(0, state.bottomNavBarIndex),
                          size: 30,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Center(
                        child: Icon(
                          Icons.search_rounded,
                          color: getIconColor(1, state.bottomNavBarIndex),
                          size: 30,
                        ),
                      ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Center(
                        child: Icon(
                          Icons.assistant_navigation,
                          size: 30,
                          color: getIconColor(2, state.bottomNavBarIndex),
                        ),
                      ),
                      label: 'Categories',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Center(
                        child: Icon(
                          size: 30,
                          Icons.person_outline_rounded,
                          color: getIconColor(3, state.bottomNavBarIndex),
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
