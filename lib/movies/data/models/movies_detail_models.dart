import 'package:movies_app/movies/data/models/genres_models.dart';
import 'package:movies_app/movies/domain/entities/movies_detail.dart';

class MoviesDetailModels extends MovieDetail {
  const MoviesDetailModels(
      {required super.id,
        required super.runtime,

      required super.genres,
      required super.voteAverage,
      required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.title});

  factory MoviesDetailModels.fromeJsom(Map<String, dynamic> json) =>
      MoviesDetailModels(
          id: json["id"],
          runtime: json["runtime"],
          genres:
              List<GenresModels>.from(json["genres"].map((x) => GenresModels.fromeJson(x))),
          voteAverage: json["vote_average"].toDouble(),
          backdropPath: json["backdrop_path"],
          overview: json["overview"],
          releaseDate: json["release_date"],
          title: json["title"]);
}
