import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movies_app/movies/presentation/widgets/movies_page/now_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/movies_page/popular_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/movies_page/top_rate_movies_widget.dart';

import '../../../core/servies/servies_locator.dart';
import '../bloc/movies_bloc/movies_bloc.dart';
import '../bloc/movies_bloc/movies_event.dart';


class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {

        return sl<MoviesBloc>()..add(GetNowMoviesEvent())..add(GetPopularMoviesEvent())..add(GetTopRateMoviesEvent());
      },
      child: Scaffold(

        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowMoviesWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,

                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More', style: TextStyle(color: Colors.white
                            ),),
                            Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white

                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularMoviesWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white
                        ,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More', style: TextStyle(color: Colors.white
                            ),),
                            Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white

                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRateMoviesWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
