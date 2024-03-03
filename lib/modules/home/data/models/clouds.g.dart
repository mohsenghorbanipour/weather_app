// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clouds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clouds _$CloudsFromJson(Map<String, dynamic> json) => Clouds(
      all: json['all'] as int?,
    );

Map<String, dynamic> _$CloudsToJson(Clouds instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('all', instance.all);
  return val;
}
