
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'review_entity.dart';

part 'review_domain.freezed.dart';

@Freezed()
class ReviewDomain with _$ReviewDomain {
  const factory ReviewDomain({
    @Default(<ReviewEntity>[]) List<ReviewEntity> results,
  }) = _ReviewDomain;
}
