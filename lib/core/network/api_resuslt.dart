import 'package:movies/core/network/api_erroe_handler.dart';

sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;
  ApiFailure(this.errorHandler);
}
