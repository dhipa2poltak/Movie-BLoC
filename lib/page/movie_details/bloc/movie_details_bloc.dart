import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'movie_details_event.dart';
import 'movie_details_state.dart';

@Injectable()
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase) : super(MovieDetailsState()) {
    on<MovieDetailsPageInitiated>((event, emit) async {
      await onMovieDetailsPageInitiated(event, emit);
    });
  }

  Future<void> onMovieDetailsPageInitiated(MovieDetailsPageInitiated event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));

    final movieId = event.movieId;
    final result = await getMovieDetailsUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      emit(state.copyWith(errorMessage: ''));
    }, (movieDetailsDomain) {
      emit(state.copyWith(
        movieId: movieId,
        title: movieDetailsDomain.title,
        description: movieDetailsDomain.overview
      ));

      if (movieDetailsDomain.imageUrl.isNotEmpty) {
        emit(state.copyWith(imageUrl: movieDetailsDomain.imageUrl));
      }
    });

    emit(state.copyWith(isLoading: false));
  }
}
