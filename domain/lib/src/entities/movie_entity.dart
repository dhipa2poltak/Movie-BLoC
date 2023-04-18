
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@Freezed()
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') String overview,
    @Default('') String imageUrl,
  }) = _MovieEntity;
}
