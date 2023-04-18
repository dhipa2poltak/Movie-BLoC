
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    @Default(false) bool isDarkMode,
  }) = _ThemeState;
}
