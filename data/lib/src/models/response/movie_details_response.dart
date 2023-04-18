
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants.dart';
import '../genre.dart';
import '../production_company.dart';
import '../production_country.dart';
import '../spoken_language.dart';

part 'movie_details_response.freezed.dart';
part 'movie_details_response.g.dart';

@Freezed()
class MovieDetailsResponse with _$MovieDetailsResponse {
  const MovieDetailsResponse._();

  const factory MovieDetailsResponse({
    @JsonKey(name: 'adult') @Default(false) bool adult,
    @JsonKey(name: 'backdrop_path') @Default('') String backdropPath,
    @JsonKey(name: 'belongs_to_collection') Object? belongsToCollection,
    @JsonKey(name: 'budget') @Default(-1) int budget,
    @JsonKey(name: 'genres') @Default(<Genre>[]) List<Genre> genres,
    @JsonKey(name: 'homepage') @Default('') String homepage,
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'imdb_id') @Default('') String imdbId,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    @JsonKey(name: 'original_title') @Default('') String originalTitle,
    @JsonKey(name: 'overview') @Default('') String overview,
    @JsonKey(name: 'popularity') @Default(0.0) double popularity,
    @JsonKey(name: 'poster_path') @Default('') String posterPath,
    @JsonKey(name: 'production_companies') @Default(<ProductionCompany>[]) List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries') @Default(<ProductionCountry>[]) List<ProductionCountry> productionCountries,
    @JsonKey(name: 'release_date') @Default('') String releaseDate,
    @JsonKey(name: 'revenue') @Default(-1) int revenue,
    @JsonKey(name: 'runtime') @Default(-1) int runtime,
    @JsonKey(name: 'spoken_languages') @Default(<SpokenLanguage>[]) List<SpokenLanguage> spokenLanguages,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'tagline') @Default('') String tagline,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'video') @Default(false) bool video,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(-1) int voteCount
  }) = _MovieDetailsResponse;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseFromJson(json);

  MovieDetailsDomain toDomain() {
    return MovieDetailsDomain(
      id: id,
      title: title,
      overview: overview,
      imageUrl: posterPath.isNotEmpty ? Constants.IMAGE_URL_BASE_PATH + posterPath : ''
    );
  }
}
