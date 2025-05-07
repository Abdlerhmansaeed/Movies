import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_images.dart';

class TabbarViewWidget extends StatelessWidget {
  const TabbarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // Watch List Screen
        Image.asset(
          AppImages.emptyProfileList,
        ),
        // History Screen
        Image.asset(
          AppImages.emptyProfileList,
        ),
      ],
    );
  }
}
