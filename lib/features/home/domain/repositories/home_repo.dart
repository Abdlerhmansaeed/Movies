import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<MovieEntity>>> getMovies();
}
