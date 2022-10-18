import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utills/enums.dart';

import '../../../domain/entities/movies.dart';


class MoviesState extends Equatable {
  final List<Movie> nowMovies;
  final RequestState nowState;
  final String nowMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRateMovies;
  final RequestState topRateState;
  final String topRateMessage;

  const MoviesState({
    this.nowMovies = const [],
    this.nowState = RequestState.loading,
    this.nowMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRateMovies = const [],
    this.topRateMessage = '',
    this.topRateState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowMovies,
    RequestState? nowState,
    String? nowMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRateMovies,
    RequestState? topRateState,
    String? topRateMessage,
  }) {
    return MoviesState(
      nowMovies: nowMovies ?? this.nowMovies,
      nowState: nowState ?? this.nowState,
      nowMessage: nowMessage ?? this.nowMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRateState: topRateState ?? this.topRateState,
      topRateMessage: topRateMessage ?? this.topRateMessage,
      topRateMovies: topRateMovies ?? this.topRateMovies,
    );
  }

  @override
  List<Object> get props => [
        nowMovies,
        nowState,
        nowMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRateMessage,
        topRateMovies,
        topRateState
      ];
}
