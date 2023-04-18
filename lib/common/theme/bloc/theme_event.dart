
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

@freezed
class ThemeInitiated extends ThemeEvent with _$ThemeInitiated {
  const factory ThemeInitiated() = _ThemeInitiated;
}

@freezed
class ThemeChanged extends ThemeEvent with _$ThemeChanged {
  const factory ThemeChanged() = _ThemeChanged;
}
