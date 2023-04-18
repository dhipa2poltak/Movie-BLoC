
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre_entity.dart';

part 'genre_domain.freezed.dart';

@Freezed()
class GenreDomain with _$GenreDomain {
  const factory GenreDomain({
    @Default(<GenreEntity>[]) List<GenreEntity> genres
  }) = _GenreDomain;
}
