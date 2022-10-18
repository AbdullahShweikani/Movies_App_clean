
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../repositories/base_movies_repositories.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter>{

  final BaseMoviesRepositories baseMoviesRepositories;

  GetTopRatedMoviesUseCase(this.baseMoviesRepositories);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async{
    return await baseMoviesRepositories.getTopRatedMovies();

  }



}