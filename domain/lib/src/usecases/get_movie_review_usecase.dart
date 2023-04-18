

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/review_domain.dart';

abstract class GetMovieReviewUseCase {

  Future<Either<AppError, ReviewDomain>> call(int movieId, int page);
}
