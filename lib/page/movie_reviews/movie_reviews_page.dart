

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:movie_bloc/page/movie_reviews/bloc/movie_reviews_bloc.dart';
import 'package:movie_bloc/page/movie_reviews/bloc/movie_reviews_event.dart';
import 'package:movie_bloc/page/movie_reviews/bloc/movie_reviews_state.dart';

import '../../common/widget/common_widget.dart';
import '../../framework/locator/inject_container.dart';
import '../../generated/l10n.dart';

@RoutePage()
class MovieReviewsPage extends StatelessWidget {

  const MovieReviewsPage({super.key, required this.movieId, required this.movieTitle});

  final int movieId;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    final appRepository = locator<AppRepository>();
    appRepository.getMovieDetail(movieId);

    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider<MovieReviewsBloc>(
        create: (BuildContext context) => locator<MovieReviewsBloc>()..add(MovieReviewsPageInitiated(movieId)),
        child: BlocConsumer<MovieReviewsBloc, MovieReviewsState>(
          listenWhen: (previous, current) => (previous.errorMessage != current.errorMessage) && current.errorMessage.isNotEmpty,
          listener: (BuildContext context, MovieReviewsState state) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.errorMessage)
                )
            );
          },
          builder: (BuildContext context, MovieReviewsState state) {
            return Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      S.of(context).review,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      movieTitle,
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
                        _buildNoReviewViewOrEmptyWidget(context, state.reviews.isEmpty && !state.isLoading),
                        _buildMovieListView(context, state.reviews),
                        buildLoadingIndicator(state.isLoading)
                      ],
                    )
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNoReviewViewOrEmptyWidget(BuildContext context, bool isNoReview) {
    if (isNoReview) {
      return Center(
        child: Text(S.of(context).no_review_available),
      );
    } else {
      return emptyWidget();
    }
  }

  Widget _buildMovieListView(BuildContext context, List<ReviewEntity> reviews) {
    return LazyLoadScrollView(
        onEndOfPage: () {
          context.read<MovieReviewsBloc>().add(const MovieReviewsPageLoadMoreData());
        },
        child: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (_, index) {
              final review = reviews[index];
              var avatarPath = review.authorDetails?.avatarPath ?? '';

              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        review.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: avatarPath.isNotEmpty ? Image.network(
                        avatarPath,
                        width: 50,
                        height: 50,
                      ) : const Icon(Icons.cancel),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Text(review.author,),
                    )
                  ],
                ),
              );
            }
        )
    );
  }
}
