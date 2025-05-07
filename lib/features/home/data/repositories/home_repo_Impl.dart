import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_erroe_handler.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/home/data/datasources/home_remote_data_source_contact.dart';
import 'package:movies/features/home/data/models/movies_model/movie.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';
import 'package:movies/features/home/domain/repositories/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSourceContract _dataSource;

  HomeRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<MovieEntity>>> getMovies() async {
    try {
      var response = await _dataSource.getMovies();
      var movies = response.data?.movies
          ?.map((movie) => MovieEntity.fromMovie(movie))
          .toList();
      return ApiSuccess(movies ?? []);
    } catch (e) {
      return ApiFailure(ErrorHandler.handle(e.toString()));
    }
  }
}
