
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/discover_movie_by_genre_domain.dart';

abstract class GetMovieByGenreUseCase {

  Future<Either<AppError, DiscoverMovieByGenreDomain>> call(String genreId, int page);
}
