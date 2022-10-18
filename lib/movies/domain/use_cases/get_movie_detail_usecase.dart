import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies_detail.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repositories.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailParameter> {

  final BaseMoviesRepositories baseMoviesRepositories;

  GetMovieDetailUseCase(this.baseMoviesRepositories);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameter parameter) async{
    return await baseMoviesRepositories.getMovieDetail(parameter);

  }




}

class MovieDetailParameter extends Equatable {

  final int movieId;

  //final String name

  const MovieDetailParameter(this.movieId);

  @override
  List<Object> get props => [movieId];


}