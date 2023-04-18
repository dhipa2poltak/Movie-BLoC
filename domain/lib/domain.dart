library domain;

import 'package:injectable/injectable.dart';

export 'src/entities/app_error.dart';
export 'src/entities/author_details_entity.dart';
export 'src/entities/discover_movie_by_genre_domain.dart';
export 'src/entities/genre_domain.dart';
export 'src/entities/genre_entity.dart';
export 'src/entities/movie_details_domain.dart';
export 'src/entities/movie_entity.dart';
export 'src/entities/review_domain.dart';
export 'src/entities/review_entity.dart';
export 'src/entities/trailer_domain.dart';
export 'src/entities/trailer_entity.dart';

export 'src/repositories/app_repository.dart';
export 'src/repositories/theme_repository.dart';

export 'src/usecases/get_movie_by_genre_usecase.dart';
export 'src/usecases/get_movie_by_genre_usecase_impl.dart';
export 'src/usecases/get_movie_details_usecase.dart';
export 'src/usecases/get_movie_details_usecase_impl.dart';
export 'src/usecases/get_movie_genre_usecase.dart';
export 'src/usecases/get_movie_genre_usecase_impl.dart';
export 'src/usecases/get_movie_review_usecase.dart';
export 'src/usecases/get_movie_review_usecase_impl.dart';
export 'src/usecases/get_movie_trailer_usecase.dart';
export 'src/usecases/get_movie_trailer_usecase_impl.dart';
export 'src/usecases/is_dark_mode_usecase.dart';
export 'src/usecases/is_dark_mode_usecase_impl.dart';
export 'src/usecases/set_dark_mode_usecase.dart';
export 'src/usecases/set_dark_mode_usecase_impl.dart';

export 'domain.module.dart';

@InjectableInit.microPackage()
initMicroPackage() {}
