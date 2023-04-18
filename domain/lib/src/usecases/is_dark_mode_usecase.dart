

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class IsDarkModeUseCase {
  Future<Either<AppError, bool>> call();
}
