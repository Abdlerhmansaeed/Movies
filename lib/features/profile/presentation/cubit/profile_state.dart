// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies/core/app_states/base_states.dart';

class ProfileState extends Equatable {
  final BaseState? profileUserDataState;
  const ProfileState({
    this.profileUserDataState,
  });

  ProfileState copyWith({
    BaseState? profileUserDataState,
  }) {
    return ProfileState(
      profileUserDataState: profileUserDataState ?? this.profileUserDataState,
    );
  }
  
  
  @override
  List<Object?> get props => [
        profileUserDataState,
  ];
}
