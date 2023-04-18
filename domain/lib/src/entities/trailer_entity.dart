
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_entity.freezed.dart';

@Freezed()
class TrailerEntity with _$TrailerEntity {
  const factory TrailerEntity({
    @Default('') String id,
    @Default('') String key,
    @Default('') String name,
    @Default('') String site,
  }) = _TrailerEntity;
}
