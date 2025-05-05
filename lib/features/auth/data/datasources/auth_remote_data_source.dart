import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequset loginRequset);
  Future<RegisterResposne> register(RegisterRequest registerRequest);
}
