import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/base/base_model.dart';

part 'send_code_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class SendCodeResponse implements BaseModel<SendCodeResponse> {

  SendCodeResponse({
    this.status,
    this.code,
    this.message,
  });

  final bool? status;
  final String? code;
  final String? message;

  @override
  factory SendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendCodeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SendCodeResponseToJson(this);
}
