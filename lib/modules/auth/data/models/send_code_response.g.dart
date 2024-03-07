// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeResponse _$SendCodeResponseFromJson(Map<String, dynamic> json) =>
    SendCodeResponse(
      status: json['status'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendCodeResponseToJson(SendCodeResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}
