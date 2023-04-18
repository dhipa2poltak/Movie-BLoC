
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../genre.dart';

part 'genre_response.freezed.dart';
part 'genre_response.g.dart';

@Freezed()
class GenreResponse with _$GenreResponse {
  const GenreResponse._();

  const factory GenreResponse({
    @JsonKey(name: 'genres') @Default(<Genre>[]) List<Genre> genres
  }) = _GenreResponse;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);

  GenreDomain toDomain() {
    final genreEntities = genres.map((e) => GenreEntity(id: e.id, name: e.name));

    return GenreDomain(genres: genreEntities.toList());
  }
}
