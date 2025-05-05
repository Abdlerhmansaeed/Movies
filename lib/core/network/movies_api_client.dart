
import 'package:dio/dio.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/features/home/data/models/movies_model/movies_model.dart';
import 'package:retrofit/retrofit.dart';
part 'movies_api_client.g.dart';
@RestApi()
abstract class MoviesApiClient {
  factory MoviesApiClient(Dio dio) = _MoviesApiClient;


  @GET(ApiConstants.getMovies)
  Future<MoviesModel> getMovies();
}
