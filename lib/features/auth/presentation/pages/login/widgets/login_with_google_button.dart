import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/helpers/spacing.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: AppColors.yellow,
                indent: 25,
                endIndent: 35,
                height: 10,
              ),
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
            Expanded(
              child: Divider(
                color: AppColors.yellow,
                indent: 25,
                endIndent: 35,
                height: 10,
              ),
            ),
          ],
        ),
        verticalSpace(20),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.google,
                color: AppColors.black,
              ),
              horizontalSpace(10),
              Text("Login With Google",
                  style: TextStyle(fontSize: 18, color: AppColors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
