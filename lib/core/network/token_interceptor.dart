import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/constants/shared_pref_keys.dart';
import 'package:movies/core/helpers/shared_pref_helper.dart';

@injectable
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Fetch the token from SharedPreferences
    final sharedPrefHelper = SharedPrefHelper();
    final token =
        await sharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
