
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_details.freezed.dart';
part 'author_details.g.dart';

@Freezed()
class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'avatar_path') @Default('') String avatarPath,
    @JsonKey(name: 'rating') @Default(0.0) double rating
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);
}
