import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/profile/domain/entities/user_data_entity.dart';
import 'package:movies/features/profile/domain/repositories/profile_repo.dart';

@injectable
class GetUserDataUseCase {
  final ProfileRepo _profileRepo;
  GetUserDataUseCase(this._profileRepo);
  Future<ApiResult<UserDataEntity>> call() async {
    return await _profileRepo.getUserData();
  }
}
