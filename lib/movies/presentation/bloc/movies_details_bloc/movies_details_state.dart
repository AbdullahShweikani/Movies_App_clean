part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {

  final MovieDetail? movieDetail;
  final RequestState moviesDetailState;
  final String moviesDetailMessage;
  final List<Recommendation>? movieRecommendation;
  final RequestState recommendationState;
  final String recommendationMessage;


  const MoviesDetailsState({this.movieDetail,
    this.moviesDetailState = RequestState.loading,
    this.moviesDetailMessage = "",
    this.movieRecommendation = const [], this.recommendationState = RequestState
        .loading, this.recommendationMessage = "",
  });

  MoviesDetailsState copyWith({

    MovieDetail? movieDetail,
    RequestState? moviesDetailState,
    String? moviesDetailMessage,
    List<Recommendation>? movieRecommendation,
    RequestState? recommendationState,
    String? recommendationMessage,

  }) {
    return MoviesDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        moviesDetailMessage: moviesDetailMessage ?? this.moviesDetailMessage,
        moviesDetailState: moviesDetailState ?? this.moviesDetailState,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        recommendationMessage: recommendationMessage ??
            this.recommendationMessage,
        recommendationState: recommendationState ?? this.recommendationState
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        moviesDetailState,
        moviesDetailMessage,
        movieRecommendation,
        recommendationState,
        recommendationMessage,
      ];



}



