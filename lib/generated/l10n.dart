// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Movie Genres`
  String get movie_genres {
    return Intl.message(
      'Movie Genres',
      name: 'movie_genres',
      desc: '',
      args: [],
    );
  }

  /// `%s Movies`
  String get title_movies_in_genre {
    return Intl.message(
      '%s Movies',
      name: 'title_movies_in_genre',
      desc: '',
      args: [],
    );
  }

  /// `Show Review`
  String get show_review {
    return Intl.message(
      'Show Review',
      name: 'show_review',
      desc: '',
      args: [],
    );
  }

  /// `Show Trailer`
  String get show_trailer {
    return Intl.message(
      'Show Trailer',
      name: 'show_trailer',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Currently no review available`
  String get no_review_available {
    return Intl.message(
      'Currently no review available',
      name: 'no_review_available',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
