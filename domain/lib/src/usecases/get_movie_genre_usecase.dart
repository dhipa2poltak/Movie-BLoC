

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/genre_domain.dart';

abstract class GetMovieGenreUseCase {

  Future<Either<AppError, GenreDomain>> call();
}
