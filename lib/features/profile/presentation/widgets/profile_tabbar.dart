import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/helpers/extentions.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({super.key,});

  @override
  Widget build(BuildContext context) {
    return TabBar(

      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.yellow,
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      tabs: [
        Tab(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list_rounded,
                color: AppColors.yellow,
                size: 20,
              ),
              Text(
                "Watch List",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: context.responsiveFont(14), // Smaller font
                ),
              ),
            ],
          ),
        ),
        Tab(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.folder_rounded,
                color: AppColors.yellow,
                size: 20, // Fixed, smaller icon size
              ),
              Text(
                "History",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: context.responsiveFont(14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
