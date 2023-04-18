
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_by_genre_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MoviesByGenreState with _$MoviesByGenreState {
  factory MoviesByGenreState({
    @Default(false) bool isLoading,
    @Default(<MovieEntity>[]) List<MovieEntity> movies,
    @Default('') String errorMessage,
    @Default(-1) int genreId,
    @Default(0) int page,
    @Default(false) bool isLastPage
  }) = _MoviesByGenreState;
}
