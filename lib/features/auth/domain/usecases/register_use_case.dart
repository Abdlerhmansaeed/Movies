import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/auth/data/models/register_request/register_request.dart';
import 'package:movies/features/auth/data/models/register_resposne/register_resposne.dart';
import 'package:movies/features/auth/domain/repositories/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _repo;

  RegisterUseCase(this._repo);

  Future<ApiResult<RegisterResposne>> call(RegisterRequest registerRequest) =>
      _repo.register(registerRequest);
}
