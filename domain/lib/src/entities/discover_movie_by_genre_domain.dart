
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_entity.dart';

part 'discover_movie_by_genre_domain.freezed.dart';

@Freezed()
class DiscoverMovieByGenreDomain with _$DiscoverMovieByGenreDomain {
  const factory DiscoverMovieByGenreDomain({
    @Default(-1) int page,
    @Default(<MovieEntity>[]) List<MovieEntity> results,
    @Default(-1) int totalPages,
    @Default(-1) int totalResults
  }) = _DiscoverMovieByGenreDomain;
}
