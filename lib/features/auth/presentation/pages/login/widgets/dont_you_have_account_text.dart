import 'package:flutter/material.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/routes/routes.dart';

class DontYouHaveAccountText extends StatelessWidget {
  const DontYouHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t Have Account ?",
          style: TextStyle(color: AppColors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.register,
            );
          },
          child: Text(
            "Create One",
            style: TextStyle(color: AppColors.yellow),
          ),
        ),
      ],
    );
  }
}
