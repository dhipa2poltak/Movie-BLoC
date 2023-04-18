

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../app_config.dart';
import '../../locator/inject_container.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @factoryMethod
  static ApiClient create() {
    final dio = locator<Dio>();

    return ApiClient(dio, baseUrl: AppConfig.baseUrl);
  }

  @GET('3/genre/movie/list')
  Future<GenreResponse> getMovieGenre();

  @GET("3/discover/movie")
  Future<DiscoverMovieByGenreResponse> getMoviesByGenre(
    @Query("with_genres") String genreId,
    @Query("page") int page
  );

  @GET("3/movie/{movie_id}")
  Future<MovieDetailsResponse> getMovieDetail(
    @Path("movie_id") int movieId
  );

  @GET("3/movie/{movie_id}/reviews")
  Future<ReviewResponse> getMovieReviews(
    @Path("movie_id") int movieId,
    @Query("page") int page,
    @Query("language") @Default('"en-US"') String language
  );

  @GET("3/movie/{movie_id}/videos")
  Future<TrailerResponse> getMovieTrailers(
    @Path("movie_id") int movieId,
    @Query("language") @Default('en-US') String language
  );
}
