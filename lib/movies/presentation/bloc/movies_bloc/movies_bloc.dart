import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utills/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_usecase.dart';

import '../../../domain/use_cases/get_top_rated_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';



class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowMoviesUseCase getNowMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase,
    )
      : super(const MoviesState()) {

    on<GetNowMoviesEvent>(_nowMoving);

    on<GetPopularMoviesEvent>(_popularMoving);

    on<GetTopRateMoviesEvent>(_topRateMoving);
  }

  FutureOr<void> _popularMoving(event, emit) async {
    final result = await getNowMoviesUseCase(const NoParameter());

    result.fold(
        (l) => emit(
              state.copyWith(
                  nowState: RequestState.error, nowMessage: l.message),
            ),
        (r) => emit(
            state.copyWith(nowState: RequestState.loaded, nowMovies: r)));
  }

  FutureOr<void> _topRateMoving(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());

    result.fold(
        (l) => emit(state.copyWith(
              topRateMessage: l.message,
              topRateState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              topRateState: RequestState.loaded,
              topRateMovies: r,
            )));
    return;
  }

  FutureOr<void> _nowMoving(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)));
  }
}
