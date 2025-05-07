import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';

class EditLogoutButtonsRow extends StatelessWidget {
  const EditLogoutButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Edit Profile",
              style: TextStyle(
                color: AppColors.black,
                fontSize: context.responsiveFont(16),
              ),
            ),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
            ),
            onPressed: () {},
            child: Text(
              "Logout",
              style: TextStyle(
                color: AppColors.white,
                fontSize: context.responsiveFont(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
