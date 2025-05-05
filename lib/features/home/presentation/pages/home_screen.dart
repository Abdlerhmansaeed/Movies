import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/features/home/presentation/widgets/movies_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.availableNow),
          MoviesCardWidget(),
          Image.asset(AppImages.watchNow),
          Row(
            children: [
              Text("Action"),
              Text("see More"),
            ],
          )
        ],
      ),
    );
  }
}
