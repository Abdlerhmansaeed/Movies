import 'package:equatable/equatable.dart';
import 'package:movies/core/app_states/base_states.dart';

class HomeState extends Equatable {
  final BaseState? homeState;
  const HomeState({
    this.homeState,
  });
  HomeState copywith({
    BaseState? homeState,
  }) {
    return HomeState(
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  List<Object> get props => [
        homeState ?? const InitialState(),
      ];
}
