import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/app_states/base_states.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/profile/domain/entities/user_data_entity.dart';
import 'package:movies/features/profile/domain/usecases/get_user_data_use_case.dart';
import 'package:movies/features/profile/presentation/cubit/profile_state.dart';
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getUserDataUseCase,
  ) : super(ProfileState());
 final GetUserDataUseCase _getUserDataUseCase;

  Future<void> getUserProfileInfo() async{
    emit(state.copyWith(profileUserDataState: LoadingState<UserDataEntity>()));
    var result = await _getUserDataUseCase();
    switch (result) {
      case ApiSuccess<UserDataEntity> success:
        emit(state.copyWith(
            profileUserDataState: SuccessState<UserDataEntity>(success.data)));
        break;
      case ApiFailure failure:
        emit(state.copyWith(
            profileUserDataState: ErrorState(
                message: failure.errorHandler.apiErrorModel.message ?? '')));
        break;
    }
  }
}
