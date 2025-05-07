import 'package:movies/features/profile/data/models/user_profile_data_model/user_profile_data_model.dart';

abstract interface class ProfileRemoteDataSourceContract {
Future<UserProfileDataModel>  getUserProfileData(); 
}
