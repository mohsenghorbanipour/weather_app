import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/constants/remote_routes.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/weather/data/models/weather_response.dart';

class WeatherRemoteProvider {
  static Future<WeatherResponse?> getWeatherData(Position position) async {
    try {
      Response? response = await Dio().get(
          Constants.weatherBaseUrl + RemoteRoutes.weather,
          queryParameters: {
            'lat': position.latitude,
            'lon': position.longitude,
            'appid': Constants.weatherApiKey,
          });
      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(
          response.data,
        );
      }
      return null;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }
}
