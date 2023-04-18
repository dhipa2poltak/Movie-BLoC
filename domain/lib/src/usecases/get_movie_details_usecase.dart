

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_details_domain.dart';

abstract class GetMovieDetailsUseCase {

  Future<Either<AppError, MovieDetailsDomain>> call(int movieId);
}
