import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String releaseDate;
  final String title;
  final int id;
  final double voteAverage;

  const Movie({
    required this.backdropPath,
    required this.genreIds,
    required this.title,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage});

  @override
  List<Object> get props =>
      [backdropPath, genreIds, overview, title, id, voteAverage,releaseDate,];

}


