import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/data_sources/remote_data_sources_movies.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repositories.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_movies_recommendation_usecase.dart';

class MoviesRepositories extends BaseMoviesRepositories {
  final BaseRemoteDataSourcesMovies baseRemoteDataSourcesMovies;

  MoviesRepositories(this.baseRemoteDataSourcesMovies);

  @override
  Future<Either<Failure, List<Movie>>> getNowMovies() async {
    final result = await baseRemoteDataSourcesMovies.getNowMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseRemoteDataSourcesMovies.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSourcesMovies.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailParameter parameter) async {
    final result =
        await baseRemoteDataSourcesMovies.getMoviesDetails(parameter);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(MovieRecommendationParameter parameter) async{


    final result=await baseRemoteDataSourcesMovies.getMoviesRecommendation(parameter);

    try{

      return Right(result);
    }
    on ServerException catch (failure){

      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
