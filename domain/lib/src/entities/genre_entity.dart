
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_entity.freezed.dart';

@Freezed()
class GenreEntity with _$GenreEntity {
  const factory GenreEntity({
    @Default(-1) int id,
    @Default("") String name
  }) = _GenreEntity;
}
