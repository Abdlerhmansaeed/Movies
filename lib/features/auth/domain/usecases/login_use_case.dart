import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/auth/data/models/login_requset/login_requset.dart';
import 'package:movies/features/auth/data/models/login_response/login_response.dart';
import 'package:movies/features/auth/domain/repositories/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _repo;

  LoginUseCase(this._repo);

  Future<ApiResult<LoginResponse>> call(LoginRequset loginRequset) =>
      _repo.login(loginRequset);
}
