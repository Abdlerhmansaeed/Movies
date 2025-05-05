import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/constants/shared_pref_keys.dart';
import 'package:movies/core/helpers/shared_pref_helper.dart';
import 'package:movies/features/layout/app_manger/app_states.dart';

@lazySingleton
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStates.initial());
  void changeBottomNavBarIndex(int index) {
    emit(state.copyWith(bottomNavBarIndex: index));
  }

  Future<void> getuserToken() async {
    final sharedPrefHelper = SharedPrefHelper();
    final userToken =
        await sharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    emit(state.copyWith(userToken: userToken));
  }
}
