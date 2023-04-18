

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/prefs_data_source.dart';

@lazySingleton
class ThemeRepositoryImpl extends ThemeRepository {

  ThemeRepositoryImpl({required this.prefsDataSource});

  PrefsDataSource prefsDataSource;

  @override
  Future<Either<AppError, bool>> isDarkMode() async {
    return Right(prefsDataSource.isDarkMode());
  }

  @override
  Future<Either<AppError, bool>> setDarkMode(bool isDarkMode) async {
    return Right(prefsDataSource.setDarkMode(isDarkMode));
  }
}
