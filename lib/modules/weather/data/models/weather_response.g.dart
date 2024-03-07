// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : MainData.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('weather', instance.weather?.map((e) => e.toJson()).toList());
  writeNotNull('main', instance.main?.toJson());
  writeNotNull('visibility', instance.visibility);
  writeNotNull('wind', instance.wind?.toJson());
  writeNotNull('clouds', instance.clouds?.toJson());
  writeNotNull('sys', instance.sys?.toJson());
  writeNotNull('name', instance.name);
  return val;
}
