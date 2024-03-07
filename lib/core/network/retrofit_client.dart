import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/constants/remote_routes.dart';
import 'package:weather_app/modules/auth/data/models/send_code_response.dart';
import 'package:weather_app/modules/auth/data/models/token_response.dart';
import 'package:weather_app/modules/weather/data/models/weather_response.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @POST(RemoteRoutes.loginSendCode)
  Future<SendCodeResponse?> loginSendCode(
    @Body() Map<String, dynamic> data,
  );

  @POST(RemoteRoutes.loginValidateCode)
  Future<TokenResponse?> loginValidateCode(
    @Body() Map<String, dynamic> data,
  );

  @GET(RemoteRoutes.loginRefreshToken)
  Future<TokenResponse?> refreshToken();

  @GET(RemoteRoutes.weather)
  Future<WeatherResponse?> getWeatherByLatLng(
    @Queries() Map<String, dynamic> params,
  );
}
