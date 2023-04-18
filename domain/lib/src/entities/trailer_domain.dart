
import 'package:domain/src/entities/trailer_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_domain.freezed.dart';

@Freezed()
class TrailerDomain with _$TrailerDomain {
  const factory TrailerDomain({
    @Default(-1) int id,
    @Default(<TrailerEntity>[]) List<TrailerEntity> results,
  }) = _TrailerDomain;
}
