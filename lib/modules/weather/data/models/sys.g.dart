// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      type: json['type'] as int?,
      country: json['country'] as String?,
      id: json['id'] as int?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$SysToJson(Sys instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('id', instance.id);
  writeNotNull('country', instance.country);
  writeNotNull('sunrise', instance.sunrise);
  writeNotNull('sunset', instance.sunset);
  return val;
}
