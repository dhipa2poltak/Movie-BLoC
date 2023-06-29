

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/app_data_source.dart';

@lazySingleton
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl({required this.appDataSource});

  AppDataSource appDataSource;

  @override
  Future<Either<AppError, GenreDomain>> getMovieGenre() {
    return appDataSource.getMovieGenre();
  }

  @override
  Future<Either<AppError, DiscoverMovieByGenreDomain>> getMoviesByGenre(String genreId, int page) {
    return appDataSource.getMoviesByGenre(genreId, page);
  }

  @override
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId) {
    return appDataSource.getMovieDetail(movieId);
  }

  @override
  Future<Either<AppError, ReviewDomain>> getMovieReviews(int movieId, int page, String language) {
    return appDataSource.getMovieReviews(movieId, page, language);
  }

  @override
  Future<Either<AppError, TrailerDomain>> getMovieTrailers(int movieId, String language) {
    return appDataSource.getMovieTrailers(movieId, language);
  }
}
