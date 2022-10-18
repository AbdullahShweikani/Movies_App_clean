import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repositories.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<List<Recommendation>,MovieRecommendationParameter>{

  final BaseMoviesRepositories baseMoviesRepositories;

  GetMovieRecommendationUseCase(this.baseMoviesRepositories);

  @override
  Future<Either<Failure, List<Recommendation>>> call(MovieRecommendationParameter parameter) async{

    return await baseMoviesRepositories.getMovieRecommendation(parameter);

  }



}
class MovieRecommendationParameter extends Equatable{
final int id;
  const MovieRecommendationParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}