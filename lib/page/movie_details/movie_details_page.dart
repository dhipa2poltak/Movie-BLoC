
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/page/movie_details/bloc/movie_details_bloc.dart';
import 'package:movie_bloc/page/movie_details/bloc/movie_details_event.dart';
import 'package:movie_bloc/page/movie_details/bloc/movie_details_state.dart';

import '../../common/widget/common_widget.dart';
import '../../framework/router/app_router.dart';
import '../../generated/l10n.dart';
import '../../framework/locator/inject_container.dart';

@RoutePage()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider<MovieDetailsBloc>(
        create: (BuildContext context) => locator<MovieDetailsBloc>()..add(MovieDetailsPageInitiated(movieId)),
        child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
          listenWhen: (previous, current) => previous.errorMessage != current.errorMessage && current.errorMessage.isNotEmpty,
          listener: (BuildContext context, MovieDetailsState state) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.errorMessage)
                )
            );
          },
          builder: (BuildContext context, MovieDetailsState state) {
            return Stack(
              children: <Widget>[
                _buildMainView(context, state),
                buildLoadingIndicator(state.isLoading)
              ],
            );
          },
        ),
      )
    );
  }

  Widget _buildMainView(BuildContext context, MovieDetailsState state) {
    return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  state.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: state.imageUrl.isNotEmpty ? Image.network(
                  state.imageUrl,
                  width: 200,
                  height: 200,
                ) : emptyWidget(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                child: Text(state.description),
              ),
              TextButton(
                child: Text(S.of(context).show_review),
                onPressed: () {
                  context.router.push(MovieReviewsRoute(movieId: movieId, movieTitle: state.title));
                },
              ),
              TextButton(
                child: Text(S.of(context).show_trailer),
                onPressed: () {
                  context.router.push(MovieTrailerRoute(movieId: movieId));
                },
              )
            ],
          ),
        )
    );
  }
}
