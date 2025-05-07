import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';
import 'package:movies/features/home/domain/repositories/home_repo.dart';

@injectable
class GetMoviesUseCase {
  final HomeRepo _homeRepo;

  GetMoviesUseCase(this._homeRepo);

  Future<ApiResult<List<MovieEntity>>> call() async {
    return await _homeRepo.getMovies();
  }
}
