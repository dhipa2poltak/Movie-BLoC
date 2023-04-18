
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_details_entity.dart';

part 'review_entity.freezed.dart';

@Freezed()
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    @Default('') String author,
    AuthorDetailsEntity? authorDetails,
    @Default('') String content,
  }) = _ReviewEntity;
}
