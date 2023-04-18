

import 'package:data/data.dart';

import 'common/app_constants.dart';

enum Flavor {
  Dev,
  Prod
}

class AppConfig {

  AppConfig._();

  static Flavor? appFlavor;

  static String get flavorName {
    switch (appFlavor) {
      case Flavor.Dev:
        return "dev";
      case Flavor.Prod:
        return "prod";
      default:
        return "dev";
    }
  }

  static String get appName {
    switch (appFlavor) {
      case Flavor.Dev:
        return AppConstants.DEV_APP_NAME;
      case Flavor.Prod:
        return AppConstants.PROD_APP_NAME;
      default:
        return AppConstants.DEV_APP_NAME;
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.Dev:
        return Constants.DEV_BASE_URL;
      case Flavor.Prod:
        return Constants.PROD_BASE_URL;
      default:
        return Constants.DEV_BASE_URL;
    }
  }
}
