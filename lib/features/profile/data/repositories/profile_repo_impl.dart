import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_erroe_handler.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/profile/data/datasources/profile_remote_data_source_contract.dart';
import 'package:movies/features/profile/domain/entities/user_data_entity.dart';
import 'package:movies/features/profile/domain/repositories/profile_repo.dart';
@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {

   final ProfileRemoteDataSourceContract _dataSource;

  ProfileRepoImpl(this._dataSource);
  @override
  Future<ApiResult<UserDataEntity>> getUserData() async{
   try{
    var response = await _dataSource.getUserProfileData();
    return ApiSuccess(UserDataEntity.fromUserProfileDataModel(response));
   }catch(error){
    return ApiFailure(ErrorHandler.handle(error.toString()));
   }
  }
}
