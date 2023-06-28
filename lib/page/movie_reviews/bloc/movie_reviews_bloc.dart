import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movie_reviews_event.dart';
import 'movie_reviews_state.dart';

@Injectable()
class MovieReviewsBloc extends Bloc<MovieReviewsEvent, MovieReviewsState> {

  final GetMovieReviewUseCase getMovieReviewUseCase;

  MovieReviewsBloc(this.getMovieReviewUseCase) : super(MovieReviewsState()) {
    on<MovieReviewsPageInitiated>((event, emit) async {
      await loadData(event.movieId, state.page + 1, emit);
    });

    on<MovieReviewsPageLoadMoreData>((event, emit) async {
      if (!state.isLoading) {
        await loadData(state.movieId, state.page + 1, emit);
      }
    });
  }

  Future<void> loadData(int movieId, int page, Emitter<MovieReviewsState> emit) async {
    if (state.isLastPage) return;

    emit(state.copyWith(isLoading: true));

    final result = await getMovieReviewUseCase(movieId, page);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      emit(state.copyWith(errorMessage: ''));
    }, (reviewDomain) {
      final reviews = reviewDomain.results;

      if (reviews.isNotEmpty) {
        final existingReviews = state.reviews;
        final newReviews = <ReviewEntity>[];
        newReviews.addAll(existingReviews);
        newReviews.addAll(reviews);

        emit(state.copyWith(
          movieId: movieId,
          page: page,
          reviews: newReviews
        ));
      } else {
        emit(state.copyWith(isLastPage: true));
      }
    });

    emit(state.copyWith(isLoading: false));
  }
}
