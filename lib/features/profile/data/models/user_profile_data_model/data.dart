import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final int? avaterId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const Data({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      email,
      password,
      name,
      phone,
      avaterId,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
