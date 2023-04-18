
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_trailer_event.freezed.dart';

@immutable
abstract class MovieTrailerEvent {
  const MovieTrailerEvent();
}

@Freezed()
class MovieTrailerPageInitiated extends MovieTrailerEvent with _$MovieTrailerPageInitiated {
  const factory MovieTrailerPageInitiated(int movieId) = _MovieTrailerPageInitiated;
}
