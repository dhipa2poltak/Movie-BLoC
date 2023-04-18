
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_bloc/common/theme/bloc/theme_event.dart';
import 'package:movie_bloc/common/theme/bloc/theme_state.dart';


@Injectable()
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  final IsDarkModeUseCase isDarkModeUseCase;
  final SetDarkModeUseCase setDarkModeUseCase;

  ThemeBloc(this.isDarkModeUseCase, this.setDarkModeUseCase) : super(ThemeState()) {
    on<ThemeInitiated>((event, emit) async {
      final result = await isDarkModeUseCase();
      result.fold((appError) {
        //--ignore
      }, (isDarkMode) {
        emit(state.copyWith(isDarkMode: isDarkMode));
      });
    });

    on<ThemeChanged>((event, emit) async {
      final isDarkMode = !state.isDarkMode;
      final result = await setDarkModeUseCase(isDarkMode);
      result.fold((appError) {
        //--ignore
      }, (isDarkMode) {
        emit(state.copyWith(isDarkMode: isDarkMode));
      });
    });
  }
}
