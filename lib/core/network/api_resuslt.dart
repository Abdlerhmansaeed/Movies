// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:movies/core/network/api_erroe_handler.dart';
// part 'api_resuslt.freezed.dart';

// @Freezed()
// abstract class ApiResult<T> with _$ApiResult<T> {
//   const factory ApiResult.success(T data) = Success<T>;
//   const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
// }

// // lib\core\network\api_resuslt.dart
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
