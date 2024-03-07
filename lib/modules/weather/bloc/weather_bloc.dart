import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/weather/data/models/weather_response.dart';
import 'package:weather_app/modules/weather/data/remote/weather_remote_provider.dart';

class WeatherBloc extends ChangeNotifier {
  bool loading = true;
  bool unableToLocation = false;
  bool unableToGetData = false;

  Position? position;

  WeatherResponse? weatherResponse;

  Future<void> init() async {
    loading = true;
    notifyListeners();
    try {
      position = await getCurrentLocation();
      if (position != null) {
        await loadWeatherData();
      } else {
        unableToLocation = true;
      }
      loading = false;
      notifyListeners();
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }

  Future<Position?> getCurrentLocation() async {
    try {
      if (await Geolocator.isLocationServiceEnabled()) {
        if (await Geolocator.checkPermission() == LocationPermission.denied) {
          LocationPermission permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            AppSettings.openAppSettings();
          } else {
            return await Geolocator.getCurrentPosition();
          }
        } else {
          return await Geolocator.getCurrentPosition();
        }
      } else {
        return Future.error('Location services are disabled.');
      }
      return null;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }

  Future<void> loadWeatherData() async {
    try {
      WeatherResponse? weatherResponse =
          await WeatherRemoteProvider.getWeatherData(position!);
      if (weatherResponse != null) {
        this.weatherResponse = weatherResponse;
        unableToGetData = false;
        unableToLocation = false;
      } else {
        unableToGetData = true;
      }
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }
}
