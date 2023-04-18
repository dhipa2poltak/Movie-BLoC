
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@Freezed()
class Genre with _$Genre {
  const factory Genre({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'name') @Default("") String name
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
