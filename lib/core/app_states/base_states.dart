import 'package:equatable/equatable.dart';

sealed class BaseState<T> extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

final class InitialState<T> extends BaseState<T> {
  const InitialState();
}

final class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

final class SuccessState<T> extends BaseState<T> {
  final T data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

final class ErrorState<T> extends BaseState<T> {
  final String message;

  const ErrorState({
    this.message = 'An error occurred',
  });

  @override
  List<Object?> get props => [message];
}
