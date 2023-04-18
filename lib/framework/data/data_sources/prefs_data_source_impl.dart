
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PrefsDataSourceImpl extends PrefsDataSource {

  PrefsDataSourceImpl(this.prefs);

  final SharedPreferences prefs;

  @override
  bool isDarkMode() {
    return prefs.getBool(Constants.KEY_PREF_IS_DARK_MODE) ?? false;
  }

  @override
  bool setDarkMode(bool isDarkMode) {
    prefs.setBool(Constants.KEY_PREF_IS_DARK_MODE, isDarkMode);

    return isDarkMode;
  }
}
