
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config.dart';
import '../../data/core/auth_interceptor.dart';
import '../../data/data_sources/prefs_data_source_impl.dart';
import '../../data/data_sources/remote_app_data_source_impl.dart';

@module
abstract class AppModule {

  @lazySingleton
  PrettyDioLogger get logger => PrettyDioLogger();

  @lazySingleton
  Dio provideDio(PrettyDioLogger loggger, AuthInterceptor authInterceptor) {
    var instance = Dio();

    if (AppConfig.appFlavor == Flavor.Dev) {
      instance.interceptors.add(loggger);
    }
    instance.interceptors.add(authInterceptor);

    return instance;
  }

  @lazySingleton
  AppDataSource provideAppDataSource(RemoteAppDataSourceImpl appDataSource) {
    return appDataSource;
  }

  @lazySingleton
  PrefsDataSource providePrefsDataSource(PrefsDataSourceImpl prefsDataSource) {
    return prefsDataSource;
  }

  @lazySingleton
  AppRepository provideAppRepository(AppRepositoryImpl appRepository) {
    return appRepository;
  }

  @lazySingleton
  ThemeRepository provideThemeRepository(ThemeRepositoryImpl themeRepository) {
    return themeRepository;
  }

  @injectable
  GetMovieGenreUseCase provideGetMovieGenreUseCase(GetMovieGenreUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetMovieByGenreUseCase provideGetMovieByGenreUseCase(GetMovieByGenreUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetMovieDetailsUseCase provideGetMovieDetailsUseCase(GetMovieDetailsUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetMovieReviewUseCase provideGetMovieReviewUseCase(GetMovieReviewUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetMovieTrailerUseCase provideGetMovieTrailerUseCase(GetMovieTrailerUseCaseImpl impl) {
    return impl;
  }

  @injectable
  IsDarkModeUseCase provideIsDarkModeUseCase(IsDarkModeUseCaseImpl impl) {
    return impl;
  }

  @injectable
  SetDarkModeUseCase provideSetDarkModeUseCase(SetDarkModeUseCaseImpl impl) {
    return impl;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
