import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_profile_data_model.g.dart';

@JsonSerializable()
class UserProfileDataModel extends Equatable {
  final String? message;
  final Data? data;

  const UserProfileDataModel({this.message, this.data});

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserProfileDataModelToJson(this);

  @override
  List<Object?> get props => [message, data];
}
