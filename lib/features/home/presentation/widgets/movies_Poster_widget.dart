import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';

class MoviesPosterWidget extends StatelessWidget {
  final double? height;
  final double? aspectRatio;
  final double? viewportFraction;
  final List<MovieEntity>? movies;
  final void Function()? onTap;
  const MoviesPosterWidget({
    super.key,
    this.height,
    this.aspectRatio,
    this.viewportFraction,
    required this.movies,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return InkWell(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.network(
              movies?[index].mediumCoverImage ?? '',
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      itemCount: movies?.length ?? 0,
      options: CarouselOptions(
        height: height ?? context.height * 0.28,
        // autoPlay: autoPlay ?? true,
        animateToClosest: true,
        aspectRatio: aspectRatio ?? 16 / 9,
        viewportFraction: viewportFraction ??
            (context.width <= 600
                ? 0.41
                : context.width <= 1200
                    ? 0.62
                    : 0.5),
        enlargeCenterPage: true,
        // autoPlayInterval: Duration(seconds: 6),
      ),
    );
  }
}
