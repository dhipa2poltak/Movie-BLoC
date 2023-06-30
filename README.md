# Movie BLoC

**Technology Stack:**
- Flutter
- Dart Programming Language
- Clean Architecture
- BLoC state management
- Get It, Injectable
- Dio, Retrofit
- AutoRoute
- Freezed, JSON Serialization
- DartZ
- Shared Preferences
- Build Flavor
- .
- .
- and many more

Download it from Play Store by clicking this [link](https://play.google.com/store/apps/details?id=com.dpfht.movie_bloc).

To run project:
1. Open Terminal then move to "root_project/domain" path and type "flutter pub get" (enter) and then "flutter pub run build_runner build --delete-conflicting-outputs" (enter)
2. Still in Terminal, move to "root_project/data" path and type "flutter pub get" (enter) and then "flutter pub run build_runner build --delete-conflicting-outputs" (enter)
3. Still in Terminal, move to  "root_project" path and then type "flutter pub get" (enter) and then "flutter pub run build_runner build --delete-conflicting-outputs" (enter)
4. Open project in Android Studio and then create two Flutter run configuration with details specified below:
    1. dev run configuration
        - Name: dev
        - Dart entrypoint: (pointing to) lib/main_dev.dart
        - Build flavor: dev

    2. prod run configuration
        - Name: prod
        - Dart entrypoint: (pointing to) lib/main_prod.dart
        - Build flavor: prod

5. Run the project with "dev" run configuration or "prod" run configuration.
