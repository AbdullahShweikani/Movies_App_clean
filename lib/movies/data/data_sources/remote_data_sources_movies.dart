import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utills/app_constanse.dart';
import 'package:movies_app/movies/data/models/movie_models.dart';
import 'package:movies_app/movies/data/models/movies_detail_models.dart';
import 'package:movies_app/movies/data/models/recommendation_models.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/use_cases/get_movies_recommendation_usecase.dart';

import '../../domain/use_cases/get_movie_detail_usecase.dart';

abstract class BaseRemoteDataSourcesMovies {
  Future<List<MovieModels>> getNowMovies();

  Future<List<MovieModels>> getPopularMovies();

  Future<List<MovieModels>> getTopRatedMovies();

  Future<MoviesDetailModels> getMoviesDetails(MovieDetailParameter parameter);
  Future<List<Recommendation>> getMoviesRecommendation(MovieRecommendationParameter parameter);
}

class RemoteDataSourcesMovies extends BaseRemoteDataSourcesMovies {
  @override
  Future<List<MovieModels>> getNowMovies() async {
    final response = await Dio().get(AppConstance.nowMoving);

    if (response.statusCode == 200) {
      return List<MovieModels>.from(
        (response.data["results"] as List).map(
          (e) => MovieModels.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModels>> getPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoving);

    if (response.statusCode == 200) {
      return List<MovieModels>.from((response.data['results'] as List)
          .map((e) => MovieModels.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModels>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoving);

    if (response.statusCode == 200) {
      return List<MovieModels>.from((response.data['results'] as List)
          .map((e) => MovieModels.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailModels> getMoviesDetails(MovieDetailParameter parameter) async {
    final response = await Dio().get(AppConstance.movieDetailPath(parameter.movieId));

    if (response.statusCode == 200) {
      return MoviesDetailModels.fromeJsom(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getMoviesRecommendation(MovieRecommendationParameter parameter) async{


    final response = await Dio().get(AppConstance.movieRecommendationPath(parameter.id));

    if (response.statusCode == 200) {
      return List<Recommendation>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
