
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class AppDataSource {
  Future<Either<AppError, GenreDomain>> getMovieGenre();
  Future<Either<AppError, DiscoverMovieByGenreDomain>> getMoviesByGenre(String genreId, int page);
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId);
  Future<Either<AppError, ReviewDomain>> getMovieReviews(int movieId, int page, String language);
  Future<Either<AppError, TrailerDomain>> getMovieTrailers(int movieId, String language);
}
