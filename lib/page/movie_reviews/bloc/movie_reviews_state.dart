

import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'movie_reviews_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MovieReviewsState with _$MovieReviewsState {
  factory MovieReviewsState({
    @Default(false) bool isLoading,
    @Default(<ReviewEntity>[]) List<ReviewEntity> reviews,
    @Default('') String errorMessage,
    @Default(-1) int movieId,
    @Default(0) int page,
    @Default(false) bool isLastPage
  }) = _MovieReviewsState;
}
