import 'package:injectable/injectable.dart';
import 'package:movies/core/network/movies_api_client.dart';
import 'package:movies/features/home/data/datasources/home_remote_data_source_contact.dart';
import 'package:movies/features/home/data/models/movies_model/movie.dart';
import 'package:movies/features/home/data/models/movies_model/movies_model.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final MoviesApiClient _apiClient;
  HomeRemoteDataSourceImpl(this._apiClient);
  @override
  Future<MoviesModel> getMovies() async {
    var response = await _apiClient.getMovies();

    return response;
  }
}
