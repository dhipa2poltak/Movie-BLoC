
import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/discover_movie_by_genre_domain.dart';
import '../entities/genre_domain.dart';
import '../entities/movie_details_domain.dart';
import '../entities/review_domain.dart';
import '../entities/trailer_domain.dart';

abstract class AppRepository {
  Future<Either<AppError, GenreDomain>> getMovieGenre();
  Future<Either<AppError, DiscoverMovieByGenreDomain>> getMoviesByGenre(String genreId, int page);
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId);
  Future<Either<AppError, ReviewDomain>> getMovieReviews(int movieId, int page, String language);
  Future<Either<AppError, TrailerDomain>> getMovieTrailers(int movieId, String language);
}
