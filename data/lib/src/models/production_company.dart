
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.freezed.dart';
part 'production_company.g.dart';

@Freezed()
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'origin_country') @Default('') String originCountry,
    @JsonKey(name: 'logo_path') @Default('') String logoPath,
    @JsonKey(name: 'id') @Default(-1) int id
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}
