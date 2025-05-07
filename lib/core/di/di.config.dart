// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/auth_remote_data_source_impl.dart'
    as _i123;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/presentation/pages/login/login_veiw_model.dart'
    as _i942;
import '../../features/auth/presentation/pages/register/register_veiw_model.dart'
    as _i256;
import '../../features/home/data/datasources/home_remote_data_source_contact.dart'
    as _i408;
import '../../features/home/data/datasources/home_remote_data_source_impl.dart'
    as _i819;
import '../../features/home/data/repositories/home_repo_Impl.dart' as _i411;
import '../../features/home/domain/repositories/home_repo.dart' as _i1021;
import '../../features/home/domain/usecases/get_movies_use_case.dart' as _i477;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/layout/app_manger/app_cubit.dart' as _i687;
import '../../features/profile/data/datasources/profile_remote_data_source_contract.dart'
    as _i961;
import '../../features/profile/data/datasources/profile_remote_data_source_impl.dart'
    as _i1036;
import '../../features/profile/data/repositories/profile_repo_impl.dart'
    as _i988;
import '../../features/profile/domain/repositories/profile_repo.dart' as _i790;
import '../../features/profile/domain/usecases/get_user_data_use_case.dart'
    as _i828;
import '../../features/profile/presentation/cubit/profile_cubit.dart' as _i36;
import '../helpers/shared_pref_helper.dart' as _i237;
import '../network/dio_module.dart' as _i614;
import '../network/movies_api_client.dart' as _i567;
import '../network/route_api_client.dart' as _i281;
import '../network/token_interceptor.dart' as _i34;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i34.TokenInterceptor>(() => _i34.TokenInterceptor());
    gh.singleton<_i237.SharedPrefHelper>(() => _i237.SharedPrefHelper());
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i528.PrettyDioLogger>(() => dioModule.providePrettyLogger());
    gh.singleton<_i361.InterceptorsWrapper>(
        () => dioModule.provideCustomInterceptor());
    gh.lazySingleton<_i687.AppCubit>(() => _i687.AppCubit());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideAuthDio(
        gh<_i361.LogInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
        gh<_i361.InterceptorsWrapper>(),
        gh<_i34.TokenInterceptor>(),
      ),
      instanceName: 'AuthDio',
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideMoviesDio(
        gh<_i361.LogInterceptor>(),
        gh<_i528.PrettyDioLogger>(),
        gh<_i361.InterceptorsWrapper>(),
      ),
      instanceName: 'MoviesDio',
    );
    gh.singleton<_i281.RouteApiClient>(() =>
        dioModule.provideAuthApiClient(gh<_i361.Dio>(instanceName: 'AuthDio')));
    gh.singleton<_i567.MoviesApiClient>(() => dioModule
        .provideMoviesApiClient(gh<_i361.Dio>(instanceName: 'MoviesDio')));
    gh.factory<_i408.HomeRemoteDataSourceContract>(
        () => _i819.HomeRemoteDataSourceImpl(gh<_i567.MoviesApiClient>()));
    gh.factory<_i961.ProfileRemoteDataSourceContract>(
        () => _i1036.ProfileRemoteDataSourceImpl(
              gh<_i281.RouteApiClient>(),
              gh<_i237.SharedPrefHelper>(),
            ));
    gh.factory<_i1021.HomeRepo>(
        () => _i411.HomeRepoImpl(gh<_i408.HomeRemoteDataSourceContract>()));
    gh.factory<_i790.ProfileRepo>(() =>
        _i988.ProfileRepoImpl(gh<_i961.ProfileRemoteDataSourceContract>()));
    gh.factory<_i107.AuthRemoteDataSource>(
        () => _i123.AuthRemoteDataSourceImpl(gh<_i281.RouteApiClient>()));
    gh.factory<_i723.AuthRepo>(
        () => _i662.AuthRepoImpl(gh<_i107.AuthRemoteDataSource>()));
    gh.factory<_i477.GetMoviesUseCase>(
        () => _i477.GetMoviesUseCase(gh<_i1021.HomeRepo>()));
    gh.factory<_i9.HomeCubit>(
        () => _i9.HomeCubit(gh<_i477.GetMoviesUseCase>()));
    gh.factory<_i828.GetUserDataUseCase>(
        () => _i828.GetUserDataUseCase(gh<_i790.ProfileRepo>()));
    gh.factory<_i37.LoginUseCase>(
        () => _i37.LoginUseCase(gh<_i723.AuthRepo>()));
    gh.factory<_i97.RegisterUseCase>(
        () => _i97.RegisterUseCase(gh<_i723.AuthRepo>()));
    gh.factory<_i942.LoginVeiwModel>(
        () => _i942.LoginVeiwModel(gh<_i37.LoginUseCase>()));
    gh.factory<_i36.ProfileCubit>(
        () => _i36.ProfileCubit(gh<_i828.GetUserDataUseCase>()));
    gh.factory<_i256.RegisterVeiwModel>(
        () => _i256.RegisterVeiwModel(gh<_i97.RegisterUseCase>()));
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}
