
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../app_config.dart';

import 'inject_container.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await locator.init(environment: AppConfig.flavorName);
}
