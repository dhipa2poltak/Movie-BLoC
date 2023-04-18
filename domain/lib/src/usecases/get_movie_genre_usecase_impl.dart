
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../entities/genre_domain.dart';
import '../repositories/app_repository.dart';
import 'get_movie_genre_usecase.dart';

@Injectable()
class GetMovieGenreUseCaseImpl extends GetMovieGenreUseCase {

  GetMovieGenreUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, GenreDomain>> call() async {
    return appRepository.getMovieGenre();
  }
}
