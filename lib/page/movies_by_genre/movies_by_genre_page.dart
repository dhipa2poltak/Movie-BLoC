

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_bloc/page/movies_by_genre/bloc/movies_by_genre_bloc.dart';
import 'package:movie_bloc/page/movies_by_genre/bloc/movies_by_genre_event.dart';
import 'package:sprintf/sprintf.dart';

import '../../common/widget/common_widget.dart';
import '../../framework/locator/inject_container.dart';
import '../../framework/router/app_router.dart';
import '../../generated/l10n.dart';
import 'bloc/movies_by_genre_state.dart';

@RoutePage()
class MoviesByGenrePage extends StatelessWidget {
  const MoviesByGenrePage({super.key, required this.genreId, required this.genreName});

  final int genreId;
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider<MoviesByGenreBloc>(
        create: (BuildContext context) => locator<MoviesByGenreBloc>()..add(MoviesByGenrePageInitiated(genreId)),
        child: BlocConsumer<MoviesByGenreBloc, MoviesByGenreState>(
          listenWhen: (previous, current) => (previous.errorMessage != current.errorMessage) && current.errorMessage.isNotEmpty,
          listener: (BuildContext context, MoviesByGenreState state) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.errorMessage)
                )
            );
          },
          builder: (BuildContext context, MoviesByGenreState state) {
            final title = sprintf(S.of(context).title_movies_in_genre, [genreName]);

            return Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Expanded(
                    child: Stack(
                      children: <Widget>[
                        _buildMovieListView(context, state.movies),
                        buildLoadingIndicator(state.isLoading)
                      ],
                    )
                )
              ],
            );
          },
        ),
      )
    );
  }

  Widget _buildMovieListView(BuildContext context, List<MovieEntity> movies) {
    return LazyLoadScrollView(
      onEndOfPage: () {
        context.read<MoviesByGenreBloc>().add(const MoviesByGenrePageLoadMoreData());
      },
      child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index) {
            final movie = movies[index];

            return ListTile(
              title: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: movie.imageUrl.isNotEmpty ? Image.network(
                        movie.imageUrl,
                        width: 100,
                        height: 100,
                      ) : emptyWidget(),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                            child: Text(
                              movie.overview,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                context.router.push(MovieDetailsRoute(movieId: movie.id));
              },
            );
          }
      )
    );
  }
}
