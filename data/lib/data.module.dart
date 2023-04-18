//@GeneratedMicroModule;DataPackageModule;package:data/data.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/src/data_sources/app_data_source.dart' as _i4;
import 'package:data/src/data_sources/prefs_data_source.dart' as _i6;
import 'package:data/src/repositories/app_repository_impl.dart' as _i3;
import 'package:data/src/repositories/theme_repository_impl.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.AppRepositoryImpl>(
        () => _i3.AppRepositoryImpl(appDataSource: gh<_i4.AppDataSource>()));
    gh.lazySingleton<_i5.ThemeRepositoryImpl>(() =>
        _i5.ThemeRepositoryImpl(prefsDataSource: gh<_i6.PrefsDataSource>()));
  }
}
