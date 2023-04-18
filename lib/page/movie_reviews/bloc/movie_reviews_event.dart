

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_reviews_event.freezed.dart';

@immutable
abstract class MovieReviewsEvent {
  const MovieReviewsEvent();
}

@Freezed()
class MovieReviewsPageInitiated extends MovieReviewsEvent with _$MovieReviewsPageInitiated {
  const factory MovieReviewsPageInitiated(int movieId) = _MovieReviewsPageInitiated;
}

@Freezed()
class MovieReviewsPageLoadMoreData extends MovieReviewsEvent with _$MovieReviewsPageLoadMoreData {
  const factory MovieReviewsPageLoadMoreData() = _MovieReviewsPageLoadMoreData;
}
