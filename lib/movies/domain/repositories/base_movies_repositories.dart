
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_detail_usecase.dart';

import '../entities/movies.dart';
import '../use_cases/get_movies_recommendation_usecase.dart';

abstract class BaseMoviesRepositories{

  Future<Either<Failure,List<Movie>>> getNowMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>>   getMovieDetail(MovieDetailParameter parameter);
  Future<Either<Failure,List<Recommendation>>>   getMovieRecommendation(MovieRecommendationParameter parameter);
}