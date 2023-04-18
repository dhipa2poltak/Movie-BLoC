import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_event.freezed.dart';

@immutable
abstract class GenreEvent {
  const GenreEvent();
}

@freezed
class GenrePageInitiated extends GenreEvent with _$GenrePageInitiated {
  const factory GenrePageInitiated() = _GenrePageInitiated;
}
