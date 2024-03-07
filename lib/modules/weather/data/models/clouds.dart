

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'clouds.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Clouds implements BaseModel<Clouds>{

  final int? all;

  Clouds({
    this.all,
  });

  @override
  factory Clouds.fromJson(Map<String, dynamic> json) =>
      _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}
