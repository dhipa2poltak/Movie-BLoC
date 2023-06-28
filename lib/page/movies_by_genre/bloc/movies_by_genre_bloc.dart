import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movies_by_genre_event.dart';
import 'movies_by_genre_state.dart';

@Injectable()
class MoviesByGenreBloc extends Bloc<MoviesByGenreEvent, MoviesByGenreState> {

  final GetMovieByGenreUseCase getMovieByGenreUseCase;

  MoviesByGenreBloc(this.getMovieByGenreUseCase) : super(MoviesByGenreState()) {
    on<MoviesByGenrePageInitiated>((event, emit) async {
      await loadData(event.genreId, state.page + 1, emit);
    });

    on<MoviesByGenrePageLoadMoreData>((event, emit) async {
      if (!state.isLoading) {
        await loadData(state.genreId, state.page + 1, emit);
      }
    });
  }

  Future<void> loadData(int genreId, int page, Emitter<MoviesByGenreState> emit) async {
    if (state.isLastPage) return;

    emit(state.copyWith(isLoading: true));

    final result = await getMovieByGenreUseCase('$genreId', page);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      emit(state.copyWith(errorMessage: ''));
    }, (movieByGenreDomain) {
        final movies = movieByGenreDomain.results;

        if (movies.isNotEmpty) {
          final existingMovies = state.movies;
          final newMovies = <MovieEntity>[];
          newMovies.addAll(existingMovies);
          newMovies.addAll(movies);

          emit(state.copyWith(
            genreId: genreId,
            page: page,
            movies: newMovies
          ));
        } else {
          emit(state.copyWith(isLastPage: true));
        }
    });

    emit(state.copyWith(isLoading: false));
  }
}
