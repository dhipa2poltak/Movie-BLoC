
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_details_entity.freezed.dart';

@Freezed()
class AuthorDetailsEntity with _$AuthorDetailsEntity {
  const factory AuthorDetailsEntity({
    @Default('') String avatarPath,
  }) = _AuthorDetailsEntity;
}
