
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_event.freezed.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

@Freezed()
class MovieDetailsPageInitiated extends MovieDetailsEvent with _$MovieDetailsPageInitiated {
  const factory MovieDetailsPageInitiated(int movieId) = _MovieDetailsPageInitiated;
}
