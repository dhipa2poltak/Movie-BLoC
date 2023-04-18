// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i7;
import 'package:data/data.module.dart' as _i3;
import 'package:dio/dio.dart' as _i18;
import 'package:domain/domain.dart' as _i6;
import 'package:domain/domain.module.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_bloc/common/theme/bloc/theme_bloc.dart' as _i17;
import 'package:movie_bloc/framework/data/core/api_client.dart' as _i5;
import 'package:movie_bloc/framework/data/core/auth_interceptor.dart' as _i9;
import 'package:movie_bloc/framework/data/data_sources/prefs_data_source_impl.dart'
    as _i20;
import 'package:movie_bloc/framework/data/data_sources/remote_app_data_source_impl.dart'
    as _i15;
import 'package:movie_bloc/framework/locator/module/app_module.dart' as _i21;
import 'package:movie_bloc/framework/router/app_router.dart' as _i8;
import 'package:movie_bloc/page/genre/bloc/genre_bloc.dart' as _i19;
import 'package:movie_bloc/page/movie_details/bloc/movie_details_bloc.dart'
    as _i10;
import 'package:movie_bloc/page/movie_reviews/bloc/movie_reviews_bloc.dart'
    as _i11;
import 'package:movie_bloc/page/movie_trailer/bloc/movie_trailer_bloc.dart'
    as _i12;
import 'package:movie_bloc/page/movies_by_genre/bloc/movies_by_genre_bloc.dart'
    as _i13;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.DataPackageModule().init(gh);
    await _i4.DomainPackageModule().init(gh);
    final appModule = _$AppModule();
    gh.lazySingleton<_i5.ApiClient>(() => _i5.ApiClient.create());
    gh.lazySingleton<_i6.AppRepository>(
        () => appModule.provideAppRepository(gh<_i7.AppRepositoryImpl>()));
    gh.lazySingleton<_i8.AppRouter>(() => _i8.AppRouter());
    gh.lazySingleton<_i9.AuthInterceptor>(() => _i9.AuthInterceptor());
    gh.factory<_i6.GetMovieByGenreUseCase>(() => appModule
        .provideGetMovieByGenreUseCase(gh<_i6.GetMovieByGenreUseCaseImpl>()));
    gh.factory<_i6.GetMovieDetailsUseCase>(() => appModule
        .provideGetMovieDetailsUseCase(gh<_i6.GetMovieDetailsUseCaseImpl>()));
    gh.factory<_i6.GetMovieGenreUseCase>(() => appModule
        .provideGetMovieGenreUseCase(gh<_i6.GetMovieGenreUseCaseImpl>()));
    gh.factory<_i6.GetMovieReviewUseCase>(() => appModule
        .provideGetMovieReviewUseCase(gh<_i6.GetMovieReviewUseCaseImpl>()));
    gh.factory<_i6.GetMovieTrailerUseCase>(() => appModule
        .provideGetMovieTrailerUseCase(gh<_i6.GetMovieTrailerUseCaseImpl>()));
    gh.factory<_i6.IsDarkModeUseCase>(() =>
        appModule.provideIsDarkModeUseCase(gh<_i6.IsDarkModeUseCaseImpl>()));
    gh.factory<_i10.MovieDetailsBloc>(
        () => _i10.MovieDetailsBloc(gh<_i6.GetMovieDetailsUseCase>()));
    gh.factory<_i11.MovieReviewsBloc>(
        () => _i11.MovieReviewsBloc(gh<_i6.GetMovieReviewUseCase>()));
    gh.factory<_i12.MovieTrailerBloc>(
        () => _i12.MovieTrailerBloc(gh<_i6.GetMovieTrailerUseCase>()));
    gh.factory<_i13.MoviesByGenreBloc>(
        () => _i13.MoviesByGenreBloc(gh<_i6.GetMovieByGenreUseCase>()));
    gh.lazySingleton<_i14.PrettyDioLogger>(() => appModule.logger);
    gh.lazySingleton<_i15.RemoteAppDataSourceImpl>(
        () => _i15.RemoteAppDataSourceImpl(gh<_i5.ApiClient>()));
    gh.factory<_i6.SetDarkModeUseCase>(() =>
        appModule.provideSetDarkModeUseCase(gh<_i6.SetDarkModeUseCaseImpl>()));
    await gh.factoryAsync<_i16.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i17.ThemeBloc>(() => _i17.ThemeBloc(
          gh<_i6.IsDarkModeUseCase>(),
          gh<_i6.SetDarkModeUseCase>(),
        ));
    gh.lazySingleton<_i6.ThemeRepository>(
        () => appModule.provideThemeRepository(gh<_i7.ThemeRepositoryImpl>()));
    gh.lazySingleton<_i7.AppDataSource>(() =>
        appModule.provideAppDataSource(gh<_i15.RemoteAppDataSourceImpl>()));
    gh.lazySingleton<_i18.Dio>(() => appModule.provideDio(
          gh<_i14.PrettyDioLogger>(),
          gh<_i9.AuthInterceptor>(),
        ));
    gh.factory<_i19.GenreBloc>(
        () => _i19.GenreBloc(gh<_i6.GetMovieGenreUseCase>()));
    gh.lazySingleton<_i20.PrefsDataSourceImpl>(
        () => _i20.PrefsDataSourceImpl(gh<_i16.SharedPreferences>()));
    gh.lazySingleton<_i7.PrefsDataSource>(
        () => appModule.providePrefsDataSource(gh<_i20.PrefsDataSourceImpl>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
