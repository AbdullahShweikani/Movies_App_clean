import 'package:movies_app/movies/domain/entities/genres.dart';

class GenresModels extends Genres {
  const GenresModels({required super.id, required super.name});


  factory GenresModels.fromeJson(Map<String,dynamic> json)=>GenresModels(id:json["id"], name: json["name"]);
}
