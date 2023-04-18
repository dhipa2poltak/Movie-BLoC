
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_domain.freezed.dart';

@Freezed()
class MovieDetailsDomain with _$MovieDetailsDomain {
  const factory MovieDetailsDomain({
    @Default(-1) int id,
    @Default('') String overview,
    @Default('') String title,
    @Default('') String imageUrl,
  }) = _MovieDetailsDomain;
}
