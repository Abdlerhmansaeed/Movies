import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: 'movie_count')
  final int? movieCount;
  final int? limit;
  @JsonKey(name: 'page_number')
  final int? pageNumber;
  final List<Movie>? movies;

  const Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [movieCount, limit, pageNumber, movies];
}
