

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/page/movie_trailer/bloc/movie_trailer_bloc.dart';
import 'package:movie_bloc/page/movie_trailer/bloc/movie_trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../common/function/common_functions.dart';
import '../../common/widget/common_widget.dart';
import '../../framework/locator/inject_container.dart';
import '../../generated/l10n.dart';
import 'bloc/movie_trailer_event.dart';

@RoutePage()
class MovieTrailerPage extends StatelessWidget {

  const MovieTrailerPage({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider<MovieTrailerBloc>(
        create: (BuildContext context) => locator<MovieTrailerBloc>()..add(MovieTrailerPageInitiated(movieId)),
        child: BlocConsumer<MovieTrailerBloc, MovieTrailerState>(
          listenWhen: (previous, current) => (previous.errorMessage != current.errorMessage) && current.errorMessage.isNotEmpty,
          listener: (BuildContext context, MovieTrailerState state) {
            ScaffoldMessenger.of(context).showSnackBar(
                snackbarMessage(
                    title: S.of(context).error,
                    message: state.errorMessage,
                    okLabel: S.of(context).ok
                )
            );
          },
          builder: (BuildContext context, MovieTrailerState state) {
            return Stack(
              children: <Widget>[
                _buildMainView(context, state),
                buildLoadingIndicator(state.isLoading)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainView(BuildContext context, MovieTrailerState state) {
    if (state.key.isEmpty) return emptyWidget();

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: state.key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          exitFullScreen();
        },
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),

          ],
        ),
        builder: (context, player) {
          return Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              ),
              Center(
                  child: player
              )
            ],
          );
        }
    );
  }
}
