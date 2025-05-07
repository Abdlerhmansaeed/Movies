import 'package:injectable/injectable.dart';
import 'package:movies/core/constants/shared_pref_keys.dart';
import 'package:movies/core/helpers/shared_pref_helper.dart';
import 'package:movies/core/network/route_api_client.dart';
import 'package:movies/features/profile/data/datasources/profile_remote_data_source_contract.dart';
import 'package:movies/features/profile/data/models/user_profile_data_model/user_profile_data_model.dart';
@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final RouteApiClient _apiClient;
  final SharedPrefHelper _sharedPrefHelper;
  ProfileRemoteDataSourceImpl(this._apiClient, this._sharedPrefHelper);
  
  @override
  Future<UserProfileDataModel> getUserProfileData()async {
   final String token =await _sharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    return _apiClient.getUserProfileData(token);
  }
}
