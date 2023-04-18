

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../entities/review_domain.dart';
import '../repositories/app_repository.dart';
import 'get_movie_review_usecase.dart';

@Injectable()
class GetMovieReviewUseCaseImpl extends GetMovieReviewUseCase {

  GetMovieReviewUseCaseImpl(this.appRepository);

  final AppRepository appRepository;
  
  @override
  Future<Either<AppError, ReviewDomain>> call(int movieId, int page) async {
    return appRepository.getMovieReviews(movieId, page, 'en-US');
  }
}
