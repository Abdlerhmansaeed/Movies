import 'package:equatable/equatable.dart';
import 'package:movies/features/home/data/models/movies_model/movie.dart';
import 'package:movies/features/home/data/models/movies_model/torrent.dart';


class MovieEntity extends Equatable {
  final int? id;
  final String? imdbCode;
  final String? title;
  final String? titleEnglish;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? language;
  final String? mpaRating;
  final String? mediumCoverImage;
  final String? backgroundImage;
  final List<Torrent>? torrents;

  const MovieEntity({
    this.id,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.language,
    this.mpaRating,
    this.mediumCoverImage,
    this.backgroundImage,
    this.torrents,
  });

  @override
  List<Object?> get props => [
        id,
        imdbCode,
        title,
        titleEnglish,
        year,
        rating,
        runtime,
        genres,
        summary,
        language,
        mpaRating,
        mediumCoverImage,
        backgroundImage,
        torrents,
      ];
      MovieEntity toEntity(Movie movie) => MovieEntity(
      id: movie.id?? 0,
      imdbCode: movie.imdbCode?? '',
      title: movie.title?? '',
      titleEnglish: movie.titleEnglish?? '',
      year: movie.year?? 0,
      rating: movie.rating?? 0.0,
      runtime: movie.runtime?? 0,
      genres: movie.genres?? [],
      summary: movie.summary?? '',
      language: movie.language?? '',
      mpaRating: movie.mpaRating?? '',
      mediumCoverImage: movie.mediumCoverImage?? '',
      backgroundImage: movie.backgroundImage?? '',
      torrents: movie.torrents?? [],
    );
}