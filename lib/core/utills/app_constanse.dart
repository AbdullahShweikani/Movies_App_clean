import 'package:movies_app/movies/domain/use_cases/get_movie_detail_usecase.dart';

class AppConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKye = "c3435cfe40aeb079689227d82bf921d3";
  static const String nowMoving = "$baseUrl/movie/now_playing?api_key=$apiKye";
  static const String popularMoving = "$baseUrl/movie/popular?api_key=$apiKye";

  static const String topRatedMoving =
      "$baseUrl/movie/top_rated?api_key=$apiKye";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';


  static String movieDetailPath(int moviesId)=>
      "$baseUrl/movie/$moviesId?api_key=$apiKye";


  static String movieRecommendationPath(int moviesId)=>
      "$baseUrl/movie/$moviesId/recommendations?api_key=$apiKye";


}
