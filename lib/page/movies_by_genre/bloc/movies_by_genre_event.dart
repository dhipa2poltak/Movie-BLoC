import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_by_genre_event.freezed.dart';

@immutable
abstract class MoviesByGenreEvent {
  const MoviesByGenreEvent();
}

@Freezed()
class MoviesByGenrePageInitiated extends MoviesByGenreEvent with _$MoviesByGenrePageInitiated {
  const factory MoviesByGenrePageInitiated(int genreId) = _MoviesByGenrePageInitiated;
}

@Freezed()
class MoviesByGenrePageLoadMoreData extends MoviesByGenreEvent with _$MoviesByGenrePageLoadMoreData {
  const factory MoviesByGenrePageLoadMoreData() = _MoviesByGenrePageLoadMoreData;
}
