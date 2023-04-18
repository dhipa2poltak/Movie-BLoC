
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/app_data_source.dart';

@lazySingleton
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl({required this.appDataSource});

  AppDataSource appDataSource;

  @override
  Future<Either<AppError, GenreDomain>> getMovieGenre() async {
    try {
      final genreDomain = await appDataSource.getMovieGenre().then((value) => value.toDomain());

      return Right(genreDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, DiscoverMovieByGenreDomain>> getMoviesByGenre(String genreId, int page) async {
    try {
      final movieDomain = await appDataSource.getMoviesByGenre(genreId, page).then((value) => value.toDomain());

      return Right(movieDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId) async {
    try {
      final detailsDomain = await appDataSource.getMovieDetail(movieId).then((value) => value.toDomain());

      return Right(detailsDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, ReviewDomain>> getMovieReviews(int movieId, int page, String language) async {
    try {
      final reviewDomain = await appDataSource.getMovieReviews(movieId, page, language).then((value) => value.toDomain());

      return Right(reviewDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, TrailerDomain>> getMovieTrailers(int movieId, String language) async {
    try {
      final trailerDomain = await appDataSource.getMovieTrailers(movieId, language).then((value) => value.toDomain());

      return Right(trailerDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
