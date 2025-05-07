import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/profile/domain/entities/user_data_entity.dart';

abstract interface class ProfileRepo {
  Future<ApiResult<UserDataEntity>> getUserData();
}
