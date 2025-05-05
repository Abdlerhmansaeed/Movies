// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_resposne.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResposne _$RegisterResposneFromJson(Map<String, dynamic> json) =>
    RegisterResposne(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResposneToJson(RegisterResposne instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
