
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_language.freezed.dart';
part 'spoken_language.g.dart';

@Freezed()
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'iso_639_1') @Default('') String iso6391,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'english_name') @Default('') String englishName
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}
