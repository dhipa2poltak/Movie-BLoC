

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../entities/discover_movie_by_genre_domain.dart';
import '../repositories/app_repository.dart';
import 'get_movie_by_genre_usecase.dart';

@Injectable()
class GetMovieByGenreUseCaseImpl extends GetMovieByGenreUseCase {

  GetMovieByGenreUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, DiscoverMovieByGenreDomain>> call(String genreId, int page) async {
    return appRepository.getMoviesByGenre(genreId, page);
  }
}
