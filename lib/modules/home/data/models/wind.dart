import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'wind.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Wind implements BaseModel<Wind> {

  final double? speed;
  final double? deg;

  Wind({
    this.deg,
    this.speed
  });

  @override
  factory Wind.fromJson(Map<String, dynamic> json) =>
      _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);

}