// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      deg: (json['deg'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('speed', instance.speed);
  writeNotNull('deg', instance.deg);
  return val;
}
