import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta extends Equatable {
  @JsonKey(name: 'server_time')
  final int? serverTime;
  @JsonKey(name: 'server_timezone')
  final String? serverTimezone;
  @JsonKey(name: 'api_version')
  final int? apiVersion;
  @JsonKey(name: 'execution_time')
  final String? executionTime;

  const Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  List<Object?> get props {
    return [
      serverTime,
      serverTimezone,
      apiVersion,
      executionTime,
    ];
  }
}
