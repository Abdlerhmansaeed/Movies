import 'package:injectable/injectable.dart';
import 'package:movies/core/network/route_api_client.dart';
import 'package:movies/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final RouteApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<LoginResponse> login(LoginRequset loginRequset) async {
    return await _apiClient.login(loginRequset);
  }

  @override
  Future<RegisterResposne> register(RegisterRequest registerRequest) async {
    return await _apiClient.register(registerRequest);
  }
}
