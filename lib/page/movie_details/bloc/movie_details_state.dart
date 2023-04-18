import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_state.freezed.dart';

@Freezed()
class MovieDetailsState with _$MovieDetailsState {
  factory MovieDetailsState({
    @Default(false) bool isLoading,
    @Default('') String title,
    @Default('') String description,
    @Default('') String imageUrl,
    @Default(-1) int movieId,
    @Default('') String errorMessage
  }) = _MovieDetailsState;
}
