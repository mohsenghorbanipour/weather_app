import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'sys.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Sys implements BaseModel<Sys> {
  Sys({
    this.type,
    this.country,
    this.id,
    this.sunrise,
    this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  @override
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
