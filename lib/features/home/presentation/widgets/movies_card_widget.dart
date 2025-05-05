import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/app_images.dart';

class MoviesCardWidget extends StatelessWidget {
  const MoviesCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            child: Image.asset(AppImages.cardTest, fit: BoxFit.fill),
          ),
        );
      },
      itemCount: 10,
      options: CarouselOptions(
        height: 350.h,
        autoPlay: true,
        animateToClosest: true,
        aspectRatio: 16 / 9,
        viewportFraction: .62,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 4),
      ),
    );
  }
}
