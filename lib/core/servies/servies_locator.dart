import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_sources/remote_data_sources_movies.dart';
import 'package:movies_app/movies/data/repositories/movies_repositories.dart';
import 'package:movies_app/movies/domain/repositories/base_movies_repositories.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/bloc/movies_details_bloc/movies_details_bloc.dart';

import '../../movies/domain/use_cases/get_movies_recommendation_usecase.dart';
import '../../movies/domain/use_cases/get_now_movies_usecase.dart';
import '../../movies/presentation/bloc/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

  ///bloc
  sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
  sl.registerFactory(() => MoviesDetailsBloc(sl(),sl()));
  
  
    //UseCase

    sl.registerLazySingleton(() => GetNowMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationUseCase(sl()));



    //Repository
sl.registerLazySingleton<BaseMoviesRepositories>(() => MoviesRepositories(sl()));
//Data Sourse
sl.registerLazySingleton<BaseRemoteDataSourcesMovies>(() =>RemoteDataSourcesMovies() );

  }
}

