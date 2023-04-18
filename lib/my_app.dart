
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/theme/app_themes.dart';
import 'common/theme/bloc/theme_bloc.dart';
import 'common/theme/bloc/theme_event.dart';
import 'common/theme/bloc/theme_state.dart';
import 'framework/locator/inject_container.dart';
import 'framework/router/app_router.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  final _appRouter = locator<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ThemeBloc>()..add(const ThemeInitiated()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp.router(
      title: 'Tmdb Bloc',
      theme: appThemeData[state.isDarkMode ? AppTheme.Dark : AppTheme.Light],
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
