

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../page/genre/genre_page.dart';
import '../../page/movie_details/movie_details_page.dart';
import '../../page/movie_reviews/movie_reviews_page.dart';
import '../../page/movie_trailer/movie_trailer_page.dart';
import '../../page/movies_by_genre/movies_by_genre_page.dart';
import '../../page/splash/splash_page.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: GenreRoute.page, path: '/genre'),
    AutoRoute(page: MoviesByGenreRoute.page, path: '/movies_by_genre'),
    AutoRoute(page: MovieDetailsRoute.page, path: '/movie_details'),
    AutoRoute(page: MovieReviewsRoute.page, path: '/movie_reviews'),
    AutoRoute(page: MovieTrailerRoute.page, path: '/movie_trailer')
  ];
}
