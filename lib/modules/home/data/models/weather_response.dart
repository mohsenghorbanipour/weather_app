import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';
import 'package:weather_app/modules/home/data/models/clouds.dart';
import 'package:weather_app/modules/home/data/models/main_data.dart';
import 'package:weather_app/modules/home/data/models/sys.dart';
import 'package:weather_app/modules/home/data/models/weather.dart';
import 'package:weather_app/modules/home/data/models/wind.dart';

part 'weather_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class WeatherResponse implements BaseModel<WeatherResponse> {

  WeatherResponse({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.sys,
    this.name,
  });

  final List<Weather>? weather;
  final MainData? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final Sys? sys;
  final String? name;

  @override
  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
