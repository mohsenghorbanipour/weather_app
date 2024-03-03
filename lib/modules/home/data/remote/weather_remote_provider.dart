import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/home/data/models/weather_response.dart';

class WeatherRemoteProvider {
  static Future<WeatherResponse?> getWeatherData(Position position) async {
    try {
      WeatherResponse? response =
          await ApiClient().retrofitClient.getWeatherByLatLng(
        {
          'lat': position.latitude,
          'lon': position.longitude,
          'appid': Constants.weatherApiKey,
        },
      );
      return response;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }
}
