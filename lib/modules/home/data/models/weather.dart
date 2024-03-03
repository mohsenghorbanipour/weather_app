import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'weather.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Weather implements BaseModel<Weather> {

  Weather({
    this.id,
    this.main,
    this.description,
  });

  final int? id;
  final String? main;
  final String? description;

  @override
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
