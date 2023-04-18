import 'package:flutter/material.dart';
import 'app_config.dart';
import 'framework/locator/inject_container.dart';
import 'my_app.dart';

void main() async {
  AppConfig.appFlavor = Flavor.Prod;
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}
