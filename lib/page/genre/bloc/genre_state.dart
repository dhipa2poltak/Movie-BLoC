import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'genre_state.freezed.dart';

@freezed
class GenreState with _$GenreState {
  factory GenreState({
    @Default(false) bool isLoading,
    @Default(<GenreEntity>[]) List<GenreEntity> genres,
    @Default('') String errorMessage
  }) = _GenreState;
}
