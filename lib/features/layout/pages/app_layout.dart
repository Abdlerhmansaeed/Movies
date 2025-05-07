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

    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: pages[state.bottomNavBarIndex],
          bottomNavigationBar: Container(
            height: 61.h,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.darkGray,
              // Optional: Add subtle shadow to make navbar float
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                      context, 0, Icons.home_rounded, state.bottomNavBarIndex),
                  _buildNavItem(context, 1, Icons.search_rounded,
                      state.bottomNavBarIndex),
                  _buildNavItem(context, 2, Icons.bookmark_border_rounded,
                      state.bottomNavBarIndex),
                  _buildNavItem(context, 3, Icons.person_outline_rounded,
                      state.bottomNavBarIndex),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
      BuildContext context, int index, IconData icon, int currentIndex) {
    final bool isSelected = index == currentIndex;

    return InkWell(
      onTap: () => context.read<AppCubit>().changeBottomNavBarIndex(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 12 : 12, vertical: isSelected ? 8 : 8),
        margin: EdgeInsets.symmetric(vertical: isSelected ? 8 : 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.yellow.withValues(alpha: 0.5),
                    blurRadius: 2,
                    spreadRadius: 1,
                  )
                ]
              : null,
        ),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
                duration: Duration(milliseconds: 300),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: 0.8 + (0.2 * value),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
              // Optional: Add animated text label that appears when selected
              if (isSelected)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: isSelected ? 4 : 0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
