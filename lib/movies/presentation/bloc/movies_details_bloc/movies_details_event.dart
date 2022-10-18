part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();


}

class GetMoviesDetailEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMoviesRecommendationEvent extends MoviesDetailsEvent {
  final int id;

  const GetMoviesRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}

