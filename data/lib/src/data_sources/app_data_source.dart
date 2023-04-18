
import '../models/response/discover_movie_by_genre_response.dart';
import '../models/response/genre_response.dart';
import '../models/response/movie_details_response.dart';
import '../models/response/review_response.dart';
import '../models/response/trailer_response.dart';

abstract class AppDataSource {
  Future<GenreResponse> getMovieGenre();
  Future<DiscoverMovieByGenreResponse> getMoviesByGenre(String genreId, int page);
  Future<MovieDetailsResponse> getMovieDetail(int movieId);
  Future<ReviewResponse> getMovieReviews(int movieId, int page, String language);
  Future<TrailerResponse> getMovieTrailers(int movieId, String language);
}
