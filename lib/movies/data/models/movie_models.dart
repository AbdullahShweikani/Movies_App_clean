import 'package:movies_app/movies/domain/entities/movies.dart';

class MovieModels extends Movie {
  const MovieModels(
      {required super.backdropPath,
      required super.genreIds,
      required super.title,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModels.fromJson(Map<String, dynamic> json) {
    return MovieModels(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        title: json["title"],
        id: json["id"],
        overview: json["overview"],
        //ToDo : check this;
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"].toDouble(),
    );
  }
}
