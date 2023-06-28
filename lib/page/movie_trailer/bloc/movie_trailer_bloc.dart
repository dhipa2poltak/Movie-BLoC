import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movie_trailer_event.dart';
import 'movie_trailer_state.dart';

@Injectable()
class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {

  final GetMovieTrailerUseCase getMovieTrailerUseCase;

  MovieTrailerBloc(this.getMovieTrailerUseCase) : super(MovieTrailerState()) {
    on<MovieTrailerPageInitiated>((event, emit) async {
      await onMovieTrailerPageInitiated(event.movieId, emit);
    });
  }

  Future<void> onMovieTrailerPageInitiated(int movieId, Emitter<MovieTrailerState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await getMovieTrailerUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
    }, (trailerDomain) {
      final youtubeEntity = _getYoutubeTrailer(trailerDomain.results);
      if (youtubeEntity != null) {
        emit(state.copyWith(
          id: youtubeEntity.id,
          name: youtubeEntity.name,
          key: youtubeEntity.key,
          movieId: movieId
        ));
      }
    });

    emit(state.copyWith(isLoading: false));
  }

  TrailerEntity? _getYoutubeTrailer(List<TrailerEntity> trailerEntities) {
    for (TrailerEntity trailer in trailerEntities) {
      if (trailer.site.toLowerCase().trim() == "youtube") {
        return trailer;
      }
    }

    return null;
  }
}
