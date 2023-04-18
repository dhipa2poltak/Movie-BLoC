
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

import '../../constants.dart';
import '../movie.dart';

part 'discover_movie_by_genre_response.freezed.dart';
part 'discover_movie_by_genre_response.g.dart';

@Freezed()
class DiscoverMovieByGenreResponse with _$DiscoverMovieByGenreResponse {
  const DiscoverMovieByGenreResponse._();

  const factory DiscoverMovieByGenreResponse({
    @JsonKey(name: 'page') @Default(-1) int page,
    @JsonKey(name: 'results') @Default(<Movie>[]) List<Movie> results,
    @JsonKey(name: 'total_pages') @Default(-1) int totalPages,
    @JsonKey(name: 'total_results') @Default(-1) int totalResults
  }) = _DiscoverMovieByGenreResponse;

  factory DiscoverMovieByGenreResponse.fromJson(Map<String, dynamic> json) => _$DiscoverMovieByGenreResponseFromJson(json);

  DiscoverMovieByGenreDomain toDomain() {
    final movieEntities = results.map((e) => MovieEntity(
      id: e.id,
      title: e.title,
      overview: e.overview,
      imageUrl: e.posterPath.isNotEmpty ? Constants.IMAGE_URL_BASE_PATH + e.posterPath : ''
    ));

    return DiscoverMovieByGenreDomain(
      page: page,
      results: movieEntities.toList(),
      totalPages: totalPages,
      totalResults: totalResults
    );
  }
}
