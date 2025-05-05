import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_erroe_handler.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';
import 'package:movies/features/auth/domain/repositories/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _dataSource;

  AuthRepoImpl(this._dataSource);

  @override
  Future<ApiResult<LoginResponse>> login(LoginRequset loginRequset) async {
    try {
      var response = await _dataSource.login(loginRequset);
      return ApiSuccess(response);
    } catch (e) {
      return ApiFailure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<RegisterResposne>> register(
      RegisterRequest registerRequest) async {
    try {
      var response = await _dataSource.register(registerRequest);
      return ApiSuccess(response);
    } catch (e) {
      return ApiFailure(ErrorHandler.handle(e));
    }
  }
}
