import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'token_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@HiveType(typeId: 1)
class TokenResponse extends HiveObject implements BaseModel<TokenResponse> {
  TokenResponse({
    this.status,
    this.message,
    this.token,
  });

  final bool? status;
  @HiveField(0)
  final String? token;
  final String? message;

  @override
  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
