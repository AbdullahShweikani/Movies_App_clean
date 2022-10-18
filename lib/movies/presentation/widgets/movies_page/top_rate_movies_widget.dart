import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utills/app_constanse.dart';
import '../../../../core/utills/enums.dart';
import '../../bloc/movies_bloc/movies_bloc.dart';
import '../../bloc/movies_bloc/movies_state.dart';


class TopRateMoviesWidget extends StatelessWidget {
  const TopRateMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(

      buildWhen: (previous, current)=>previous.topRateState!=current.topRateState,

      builder: (context, state) {

        switch (state.topRateState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            );

          case RequestState.loaded:

            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRateMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRateMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 170,
                child: Center(
                  child: Text(state.topRateMessage),
                ));
        }
      },
    );
  }
}
