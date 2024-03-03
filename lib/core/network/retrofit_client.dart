import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/constants/remote_routes.dart';
import 'package:weather_app/modules/home/data/models/weather_response.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET(RemoteRoutes.weather)
  Future<WeatherResponse?> getWeatherByLatLng(
    @Queries() Map<String, dynamic> params,
  );
}
