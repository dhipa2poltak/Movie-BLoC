
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../trailer.dart';

part 'trailer_response.freezed.dart';
part 'trailer_response.g.dart';

@Freezed()
class TrailerResponse with _$TrailerResponse {

  const TrailerResponse._();

  const factory TrailerResponse({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'results') @Default(<Trailer>[]) List<Trailer> results,
  }) = _TrailerResponse;

  factory TrailerResponse.fromJson(Map<String, dynamic> json) => _$TrailerResponseFromJson(json);

  TrailerDomain toDomain() {
    final trailerEntities = results.map((e) => TrailerEntity(id: e.id, name: e.name, key: e.key, site: e.site));

    return TrailerDomain(results: trailerEntities.toList());
  }
}

