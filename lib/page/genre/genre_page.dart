
import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/page/genre/bloc/genre_bloc.dart';
import 'package:movie_bloc/page/genre/bloc/genre_event.dart';

import '../../common/widget/common_widget.dart';
import '../../framework/router/app_router.dart';
import '../../generated/l10n.dart';
import '../../framework/locator/inject_container.dart';
import 'bloc/genre_state.dart';

@RoutePage()
class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: BlocProvider<GenreBloc>(
          create: (BuildContext context) => locator<GenreBloc>()..add(const GenrePageInitiated()),
          child: BlocConsumer<GenreBloc, GenreState>(
            listenWhen: (previous, current) => previous.errorMessage != current.errorMessage && current.errorMessage.isNotEmpty,
            listener: (BuildContext context, GenreState state) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.errorMessage)
                  )
              );
            },
            builder: (BuildContext context, GenreState state) {
              return Column(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        S.of(context).movie_genres,
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
                          _buildGenreListView(context, state.genres),
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

  Widget _buildGenreListView(BuildContext context, List<GenreEntity> genres) {
    return ListView.builder(
        itemCount: genres.length,
        itemBuilder: (_, index) {
          final genre = genres[index];

          return Card(
            child: ListTile(
              title: Text(genre.name),
              onTap: () {
                context.router.push(MoviesByGenreRoute(genreId: genre.id, genreName: genre.name));
              },
            ),
          );
        }
    );
  }
}
