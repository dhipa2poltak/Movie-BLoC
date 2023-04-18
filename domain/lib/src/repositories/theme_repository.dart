

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class ThemeRepository {
  Future<Either<AppError, bool>> isDarkMode();
  Future<Either<AppError, bool>> setDarkMode(bool isDarkMode);
}
