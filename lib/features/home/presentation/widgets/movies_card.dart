import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/app_images.dart';

class MoviesCardWidget extends StatelessWidget {
  const MoviesCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 122.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(AppImages.cardTest2),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
