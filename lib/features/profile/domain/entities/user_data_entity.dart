// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies/features/profile/data/models/user_profile_data_model/user_profile_data_model.dart';

class UserDataEntity {
  final String name;
  final String phone;
  UserDataEntity({
    required this.name,
    required this.phone,
  });
 static UserDataEntity fromUserProfileDataModel(UserProfileDataModel userProfileDataModel) {
    return UserDataEntity(
      name: userProfileDataModel.data?.name != null && userProfileDataModel.data!.name!.isNotEmpty
          ? userProfileDataModel.data!.name!
          : throw ArgumentError('Name cannot be null or empty'),
      phone: userProfileDataModel.data?.phone ?? '',
    );
  }
}
