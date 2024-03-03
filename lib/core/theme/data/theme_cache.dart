import 'package:weather_app/core/resources/cache/config_box.dart';
import 'package:weather_app/core/theme/style/weather_theme.dart';
import 'package:weather_app/core/utils/logger_helper.dart';

class ThemeCache {
  static const String _themeIdKey = 'weather-theme-id';

  static Future<void> setThemeId(String? id) async {
    try {
      await ConfigBox.setConfig(_themeIdKey, id);
    } catch (e) {
      LoggerHelper.logger.e(e);
    }
  }

  static Future<String> getThemeId() async {
    String? baseUrl = await ConfigBox.getConfig(_themeIdKey);
    return baseUrl ?? theme.light.toString();
  }
}
