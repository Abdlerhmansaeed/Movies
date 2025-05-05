import 'package:injectable/injectable.dart';
import 'package:movies/features/home/data/datasources/home_remote_data_source_contact.dart';
import 'package:movies/features/home/data/models/movies_model/movies_model.dart';
@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract{
  @override
  Future<MoviesModel> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}