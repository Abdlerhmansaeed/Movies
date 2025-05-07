import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/app_states/base_states.dart';
import 'package:movies/core/network/api_resuslt.dart';
import 'package:movies/features/home/domain/entities/movies_enitity.dart';
import 'package:movies/features/home/domain/usecases/get_movies_use_case.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getMoviesUseCase) : super(HomeState());
  final GetMoviesUseCase _getMoviesUseCase;

  Future<void> getMovies() async {
    emit(state.copywith(homeState: LoadingState<List<MovieEntity>>()));
    var result = await _getMoviesUseCase();
    switch (result) {
      case ApiSuccess<List<MovieEntity>> success:
        emit(state.copywith(
            homeState: SuccessState<List<MovieEntity>>(success.data)));
        break;
      case ApiFailure failure:
        emit(state.copywith(
            homeState: ErrorState(
                message: failure.errorHandler.apiErrorModel.message ?? '')));
        break;
    }
  }
}
