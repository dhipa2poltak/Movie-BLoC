library data;

import 'package:injectable/injectable.dart';

export 'src/constants.dart';
export 'src/data_sources/app_data_source.dart';
export 'src/data_sources/prefs_data_source.dart';
export 'src/models/response/genre_response.dart';
export 'src/models/response/discover_movie_by_genre_response.dart';
export 'src/models/response/movie_details_response.dart';
export 'src/models/response/review_response.dart';
export 'src/models/response/trailer_response.dart';
export 'src/models/response/error_response.dart';
export 'src/repositories/app_repository_impl.dart';
export 'src/repositories/theme_repository_impl.dart';

export 'data.module.dart';

@InjectableInit.microPackage()
initMicroPackage() {}
