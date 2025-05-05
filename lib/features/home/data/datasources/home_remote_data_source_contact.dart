import 'package:movies/features/home/data/models/movies_model/movies_model.dart';

abstract interface class HomeRemoteDataSourceContract {
  Future<MoviesModel> getMovies();
}
