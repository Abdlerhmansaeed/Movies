import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'torrent.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Equatable {
  final int? id;
  final String? url;
  @JsonKey(name: 'imdb_code')
  final String? imdbCode;
  final String? title;
  @JsonKey(name: 'title_english')
  final String? titleEnglish;
  @JsonKey(name: 'title_long')
  final String? titleLong;
  final String? slug;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  @JsonKey(name: 'description_full')
  final String? descriptionFull;
  final String? synopsis;
  @JsonKey(name: 'yt_trailer_code')
  final String? ytTrailerCode;
  final String? language;
  @JsonKey(name: 'mpa_rating')
  final String? mpaRating;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @JsonKey(name: 'background_image_original')
  final String? backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
  final String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
  final String? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
  final String? largeCoverImage;
  final String? state;
  final List<Torrent>? torrents;
  @JsonKey(name: 'date_uploaded')
  final String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
  final int? dateUploadedUnix;

  const Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      url,
      imdbCode,
      title,
      titleEnglish,
      titleLong,
      slug,
      year,
      rating,
      runtime,
      genres,
      summary,
      descriptionFull,
      synopsis,
      ytTrailerCode,
      language,
      mpaRating,
      backgroundImage,
      backgroundImageOriginal,
      smallCoverImage,
      mediumCoverImage,
      largeCoverImage,
      state,
      torrents,
      dateUploaded,
      dateUploadedUnix,
    ];
  }
}
