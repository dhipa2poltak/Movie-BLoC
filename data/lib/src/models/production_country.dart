
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_country.freezed.dart';
part 'production_country.g.dart';

@Freezed()
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') @Default('') String iso31661,
    @JsonKey(name: 'name') @Default('') String name
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);
}
