// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDataModel _$UserProfileDataModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileDataModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileDataModelToJson(
        UserProfileDataModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
