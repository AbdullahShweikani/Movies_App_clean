import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utills/enums.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import '../../../domain/entities/movies_detail.dart';
import '../../../domain/use_cases/get_movie_detail_usecase.dart';
import '../../../domain/use_cases/get_movies_recommendation_usecase.dart';

part 'movies_details_event.dart';

part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  MoviesDetailsBloc(
      this.getMovieDetailUseCase, this.getMovieRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailEvent>(_getMoviesDetails);
    on<GetMoviesRecommendationEvent>(_getMoviesRecommendation);
  }

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getMovieDetailUseCase(MovieDetailParameter(event.id));

    result.fold(
        (l) => emit(state.copyWith(
            moviesDetailMessage: l.message,
            moviesDetailState: RequestState.error)),
        (r) => emit(state.copyWith(
            moviesDetailState: RequestState.loaded, movieDetail: r)));
  }

  FutureOr<void> _getMoviesRecommendation(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getMovieRecommendationUseCase(
        MovieRecommendationParameter(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationMessage: l.message,
            recommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            recommendationState: RequestState.loaded, movieRecommendation: r)));
  }
}
