
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

import '../core/api_client.dart';

@lazySingleton
class RemoteAppDataSourceImpl extends AppDataSource {
  RemoteAppDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<GenreResponse> getMovieGenre() {
    return apiClient.getMovieGenre();
  }

  @override
  Future<DiscoverMovieByGenreResponse> getMoviesByGenre(String genreId, int page) {
    return apiClient.getMoviesByGenre(genreId, page);
  }

  @override
  Future<MovieDetailsResponse> getMovieDetail(int movieId) {
    return apiClient.getMovieDetail(movieId);
  }

  @override
  Future<ReviewResponse> getMovieReviews(int movieId, int page, String language) {
    return apiClient.getMovieReviews(movieId, page, language);
  }

  @override
  Future<TrailerResponse> getMovieTrailers(int movieId, String language) {
    return apiClient.getMovieTrailers(movieId, language);
  }
}
