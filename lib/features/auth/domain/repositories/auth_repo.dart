import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';

abstract interface class AuthRepo {
  Future<ApiResult<LoginResponse>> login(LoginRequset loginRequset);
  Future<ApiResult<RegisterResposne>> register(RegisterRequest registerRequest);
}
