

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/theme_repository.dart';
import 'set_dark_mode_usecase.dart';


@Injectable()
class SetDarkModeUseCaseImpl extends SetDarkModeUseCase {

  SetDarkModeUseCaseImpl(this.themeRepository);

  final ThemeRepository themeRepository;

  @override
  Future<Either<AppError, bool>> call(bool isDarkMode) async {
    return themeRepository.setDarkMode(isDarkMode);
  }
}
