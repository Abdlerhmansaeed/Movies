import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_config.dart';
import 'package:movies/core/network/route_api_client.dart';
import 'package:movies/core/network/movies_api_client.dart'; // استيراد MoviesApiClient
import 'package:movies/core/network/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  static const Duration _timeout = Duration(seconds: 60);

  @Singleton()
  LogInterceptor provideLogger() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      );

  @Singleton()
  PrettyDioLogger providePrettyLogger() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      );

  @Singleton()
  InterceptorsWrapper provideCustomInterceptor() => InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) {
          print("❌ Dio Error: ${e.message}");
          return handler.next(e);
        },
      );

  @Named('MoviesDio')
  @Singleton()
  Dio provideMoviesDio(
    LogInterceptor logger,
    PrettyDioLogger prettyLogger,
    InterceptorsWrapper customInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.moviesBaseUrl,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        responseType: ResponseType.json,
        contentType: 'application/json',
      ),
    );

    // لا حاجة لـ TokenInterceptor إذا كانت طلبات الأفلام لا تتطلب توكن
    dio.interceptors.addAll([
      logger,
      prettyLogger,
      customInterceptor,
    ]);

    return dio;
  }

  @Named('AuthDio')
  @Singleton()
  Dio provideAuthDio(
    LogInterceptor logger,
    PrettyDioLogger prettyLogger,
    InterceptorsWrapper customInterceptor,
    TokenInterceptor tokenInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.routeAuthUrl,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        responseType: ResponseType.json,
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      tokenInterceptor,
      logger,
      prettyLogger,
      customInterceptor,
    ]);

    return dio;
  }

  @Singleton()
  MoviesApiClient provideMoviesApiClient(@Named('MoviesDio') Dio dio) {
    return MoviesApiClient(dio);
  }

  @Singleton()
  RouteApiClient provideAuthApiClient(@Named('AuthDio') Dio dio) {
    return RouteApiClient(dio);
  }
}
