import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'meta.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel extends Equatable {
  final String? status;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  final Data? data;
  @JsonKey(name: '@meta')
  final Meta? meta;

  const MoviesModel({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return _$MoviesModelFromJson(json);
  }

  @override
  List<Object?> get props => [status, statusMessage, data, meta];
}
