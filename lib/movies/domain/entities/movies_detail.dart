import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final int runtime;
  final double voteAverage;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final List<Genres>  genres;

  const
  MovieDetail( {
required   this.runtime,
    required this.id,
    required this.genres,
    required this.voteAverage,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title});

  @override
  List<Object> get props =>
      [id, voteAverage, backdropPath, overview, releaseDate, title,genres,runtime];




}