
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../review.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@Freezed()
class ReviewResponse with _$ReviewResponse {

  const ReviewResponse._();

  const factory ReviewResponse({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'page') @Default(-1) int page,
    @JsonKey(name: 'results') @Default(<Review>[]) List<Review> results,
    @JsonKey(name: 'total_pages') @Default(-1) int totalPages,
    @JsonKey(name: 'total_results') @Default(-1) int totalResults
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => _$ReviewResponseFromJson(json);

  ReviewDomain toDomain() {
    final reviewEntities = results.map((e) {
      var imageUrl = e.authorDetails?.avatarPath ?? '';
      if (imageUrl.startsWith('/')) {
        imageUrl = imageUrl.replaceFirst('/', '');
      }

      if (!imageUrl.startsWith('http')) {
        imageUrl = '';
      }

      final authorDetailsEntity = AuthorDetailsEntity(avatarPath: imageUrl);
      final reviewEntity = ReviewEntity(author: e.author, authorDetails: authorDetailsEntity, content: e.content);

      return reviewEntity;
    });

    return ReviewDomain(results: reviewEntities.toList());
  }
}
