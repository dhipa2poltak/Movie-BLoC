

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../entities/trailer_domain.dart';
import '../repositories/app_repository.dart';
import 'get_movie_trailer_usecase.dart';

@Injectable()
class GetMovieTrailerUseCaseImpl extends GetMovieTrailerUseCase {

  GetMovieTrailerUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, TrailerDomain>> call(int movieId) async {
    return appRepository.getMovieTrailers(movieId, 'en-US');
  }
}
