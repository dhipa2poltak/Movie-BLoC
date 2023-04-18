
import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    unselectedWidgetColor: Colors.transparent,
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
};
