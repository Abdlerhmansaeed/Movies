import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_states/base_states.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';
import 'package:movies/features/home/presentation/widgets/movies_Poster_widget.dart';
import 'package:movies/features/home/presentation/widgets/movies_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getMovies(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            List<MovieEntity> movies =
                state.homeState is SuccessState<List<MovieEntity>>
                    ? (state.homeState as SuccessState<List<MovieEntity>>).data
                    : [];
            return state.homeState is LoadingState
                ? const Center(child: CircularProgressIndicator())
                : state.homeState is ErrorState
                    ? Center(
                        child: Text(
                          (state.homeState as ErrorState).message,
                          style: const TextStyle(color: AppColors.white),
                        ),
                      )
                    : state.homeState is SuccessState
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 12.h),
                            child: Column(
                              children: [
                                Image.asset(AppImages.availableNow),
                                MoviesPosterWidget(
                                  movies: movies,
                                ),
                                Image.asset(
                                  AppImages.watchNow,
                                  width: context.width,
                                  height: context.height * 0.20,
                                ),
                                Row(
                                  children: [
                                    Text("Action",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 20.sp)),
                                    const Spacer(),
                                    TextButton(
                                      child: Text(
                                        "See More >>",
                                        style: TextStyle(
                                            color: AppColors.yellow,
                                            fontSize: 16.sp),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.height * 0.25,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return MoviesCardWidget();
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 8.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Center(
                            child: Text(
                              "No Movies Available",
                              style: TextStyle(color: AppColors.white),
                            ),
                          );
          },
        ),
      ),
    );
  }
}
