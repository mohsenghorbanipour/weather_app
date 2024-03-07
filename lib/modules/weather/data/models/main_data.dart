import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'main_data.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class MainData implements BaseModel<MainData> {
  
  MainData({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final double? pressure;
  final double? humidity;

  @override
  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);
  Map<String, dynamic> toJson() => _$MainDataToJson(this);

}
