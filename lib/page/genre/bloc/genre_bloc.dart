import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'genre_event.dart';
import 'genre_state.dart';

@Injectable()
class GenreBloc extends Bloc<GenreEvent, GenreState> {

  final GetMovieGenreUseCase getMovieGenreUseCase;

  GenreBloc(this.getMovieGenreUseCase) : super(GenreState()) {
    on<GenrePageInitiated>((event, emit) async {
      await onGenrePageInitiated(event, emit);
    });
  }

  Future<void> onGenrePageInitiated(GenrePageInitiated event, Emitter<GenreState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await getMovieGenreUseCase();
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
    }, (genreDomain) {
      if (genreDomain.genres.isNotEmpty) {
        final genres = genreDomain.genres;
        emit(state.copyWith(genres: genres));
      }
    });

    emit(state.copyWith(isLoading: false));
  }
}
