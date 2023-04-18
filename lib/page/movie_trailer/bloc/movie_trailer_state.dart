
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_trailer_state.freezed.dart';

@Freezed()
class MovieTrailerState with _$MovieTrailerState {
  factory MovieTrailerState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default('') String id,
    @Default('') String key,
    @Default('') String name,
    @Default(-1) int movieId,
  }) = _MovieTrailerState;
}
