
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../core/api_client.dart';

@lazySingleton
class RemoteAppDataSourceImpl extends AppDataSource {
  RemoteAppDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<Either<AppError, GenreDomain>> getMovieGenre() async {
    try {
      final response = await apiClient.getMovieGenre();

      return Right(response.toDomain());
    } on IOException catch(_) {
      return const Left(AppError(message: "error in connection"));
    } on DioException catch(e) {
      final errorResponse = _convertErrorBody(e);
      return Left(AppError(message: errorResponse?.statusMessage ?? "error http"));
    } catch (e) {
      return const Left(AppError(message: "error in conversion"));
    }
  }

  @override
  Future<Either<AppError, DiscoverMovieByGenreDomain>> getMoviesByGenre(String genreId, int page) async {
    try {
      final response = await apiClient.getMoviesByGenre(genreId, page);

      return Right(response.toDomain());
    } on IOException catch(_) {
      return const Left(AppError(message: "error in connection"));
    } on DioException catch(e) {
      final errorResponse = _convertErrorBody(e);
      return Left(AppError(message: errorResponse?.statusMessage ?? "error http"));
    } catch (e) {
      return const Left(AppError(message: "error in conversion"));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId) async {
    try {
      final response = await apiClient.getMovieDetail(movieId);

      return Right(response.toDomain());
    } on IOException catch(_) {
      return const Left(AppError(message: "error in connection"));
    } on DioException catch(e) {
      final errorResponse = _convertErrorBody(e);
      return Left(AppError(message: errorResponse?.statusMessage ?? "error http"));
    } catch (e) {
      return const Left(AppError(message: "error in conversion"));
    }
  }

  @override
  Future<Either<AppError, ReviewDomain>> getMovieReviews(int movieId, int page, String language) async {
    try {
      final response = await apiClient.getMovieReviews(movieId, page, language);

      return Right(response.toDomain());
    } on IOException catch(_) {
      return const Left(AppError(message: "error in connection"));
    } on DioException catch(e) {
      final errorResponse = _convertErrorBody(e);
      return Left(AppError(message: errorResponse?.statusMessage ?? "error http"));
    } catch (e) {
      return const Left(AppError(message: "error in conversion"));
    }
  }

  @override
  Future<Either<AppError, TrailerDomain>> getMovieTrailers(int movieId, String language) async {
    try {
      final response = await apiClient.getMovieTrailers(movieId, language);

      return Right(response.toDomain());
    } on IOException catch(_) {
      return const Left(AppError(message: "error in connection"));
    } on DioException catch(e) {
      final errorResponse = _convertErrorBody(e);
      return Left(AppError(message: errorResponse?.statusMessage ?? "error http"));
    } catch (e) {
      return const Left(AppError(message: "error in conversion"));
    }
  }

  ErrorResponse? _convertErrorBody(DioException e) {
    final map = jsonDecode(e.response.toString());
    if (map != null) {
      return ErrorResponse.fromJson(map);
    }

    return null;
  }
}
