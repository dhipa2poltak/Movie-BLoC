
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer.freezed.dart';
part 'trailer.g.dart';

@Freezed()
class Trailer with _$Trailer {
  const factory Trailer({
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'iso_639_1') @Default('') String iso6391,
    @JsonKey(name: 'iso_3166_1') @Default('') String iso31661,
    @JsonKey(name: 'key') @Default('') String key,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'site') @Default('') String site,
    @JsonKey(name: 'size') @Default(-1) int size,
    @JsonKey(name: 'type') @Default('') String type
  }) = _Trailer;

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);
}
