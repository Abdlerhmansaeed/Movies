import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/features/profile/domain/entities/user_data_entity.dart';

class UserInfoRow extends StatelessWidget {
 final  UserDataEntity userDataEntity;
  const UserInfoRow({super.key, required this.userDataEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Profile pic and name
        Column(
          children: [
            CircleAvatar(
              radius: context.width * 0.12,
              backgroundImage: AssetImage(AppImages.profileImage),
            ),
            verticalSpace(8),
            Text(
              userDataEntity.name,
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Wish list stats
        Column(
          children: [
            Text(
              "12",
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Wish List",
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // History stats
        Column(
          children: [
            Text(
              "10",
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "History",
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
