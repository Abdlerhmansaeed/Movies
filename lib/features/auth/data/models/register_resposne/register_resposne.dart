import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register_resposne.g.dart';

@JsonSerializable()
class RegisterResposne {
  String? message;
  Data? data;

  RegisterResposne({this.message, this.data});

  factory RegisterResposne.fromJson(Map<String, dynamic> json) {
    return _$RegisterResposneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterResposneToJson(this);

  RegisterResposne copyWith({
    String? message,
    Data? data,
  }) {
    return RegisterResposne(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
