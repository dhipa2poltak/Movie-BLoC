

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/trailer_domain.dart';

abstract class GetMovieTrailerUseCase {
  Future<Either<AppError, TrailerDomain>> call(int movieId);
}
