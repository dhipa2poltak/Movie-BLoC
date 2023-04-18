
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_details.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@Freezed()
class Review with _$Review {
  const factory Review({
    @JsonKey(name: 'author') @Default('') String author,
    @JsonKey(name: 'author_details') AuthorDetails? authorDetails,
    @JsonKey(name: 'content') @Default('') String content,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'url') @Default('') String url
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
