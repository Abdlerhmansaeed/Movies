import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_states/base_states.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:movies/features/profile/presentation/cubit/profile_state.dart';
import 'package:movies/features/profile/presentation/widgets/edit_logout_buttons_row.dart';
import 'package:movies/features/profile/presentation/widgets/profile_shimmer.dart';
import 'package:movies/features/profile/presentation/widgets/profile_tabbar.dart';
import 'package:movies/features/profile/presentation/widgets/tabbar_view_widget.dart';
import 'package:movies/features/profile/presentation/widgets/user_info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserProfileInfo(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state.profileUserDataState is LoadingState) {
                  return const Center(
                    child: ProfileSkeleton(),
                  );
                } else if (state.profileUserDataState is ErrorState) {
                  return Center(
                    child: Text(
                      (state.profileUserDataState as ErrorState).message,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  );
                } else {
                  var userData =
                      (state.profileUserDataState as SuccessState).data;
                  return Column(
                    children: [
                      Container(
                        color: AppColors.black,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  UserInfoRow(
                                    userDataEntity: userData,
                                  ),
                                  verticalSpace(16),
                                  // Buttons row
                                  EditLogoutButtonsRow(),
                                ],
                              ),
                            ),
                            // TabBar
                            ProfileTabbar(),
                          ],
                        ),
                      ),
                      Expanded(child: TabbarViewWidget()),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
