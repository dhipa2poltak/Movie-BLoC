//@GeneratedMicroModule;DomainPackageModule;package:domain/domain.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/src/repositories/app_repository.dart' as _i4;
import 'package:domain/src/repositories/theme_repository.dart' as _i10;
import 'package:domain/src/usecases/get_movie_by_genre_usecase_impl.dart'
    as _i3;
import 'package:domain/src/usecases/get_movie_details_usecase_impl.dart' as _i5;
import 'package:domain/src/usecases/get_movie_genre_usecase_impl.dart' as _i6;
import 'package:domain/src/usecases/get_movie_review_usecase_impl.dart' as _i7;
import 'package:domain/src/usecases/get_movie_trailer_usecase_impl.dart' as _i8;
import 'package:domain/src/usecases/is_dark_mode_usecase_impl.dart' as _i9;
import 'package:domain/src/usecases/set_dark_mode_usecase_impl.dart' as _i11;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.GetMovieByGenreUseCaseImpl>(
        () => _i3.GetMovieByGenreUseCaseImpl(gh<_i4.AppRepository>()));
    gh.factory<_i5.GetMovieDetailsUseCaseImpl>(
        () => _i5.GetMovieDetailsUseCaseImpl(gh<_i4.AppRepository>()));
    gh.factory<_i6.GetMovieGenreUseCaseImpl>(
        () => _i6.GetMovieGenreUseCaseImpl(gh<_i4.AppRepository>()));
    gh.factory<_i7.GetMovieReviewUseCaseImpl>(
        () => _i7.GetMovieReviewUseCaseImpl(gh<_i4.AppRepository>()));
    gh.factory<_i8.GetMovieTrailerUseCaseImpl>(
        () => _i8.GetMovieTrailerUseCaseImpl(gh<_i4.AppRepository>()));
    gh.factory<_i9.IsDarkModeUseCaseImpl>(
        () => _i9.IsDarkModeUseCaseImpl(gh<_i10.ThemeRepository>()));
    gh.factory<_i11.SetDarkModeUseCaseImpl>(
        () => _i11.SetDarkModeUseCaseImpl(gh<_i10.ThemeRepository>()));
  }
}
