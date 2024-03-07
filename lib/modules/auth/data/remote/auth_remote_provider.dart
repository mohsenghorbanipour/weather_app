import 'package:weather_app/core/components/toast_component.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/auth/data/models/send_code_response.dart';
import 'package:weather_app/modules/auth/data/models/token_response.dart';

class AuthRemoteProvider {
  static Future<SendCodeResponse?> loginSendCode(String phone) async {
    try {
      SendCodeResponse? response =
          await ApiClient().retrofitClient.loginSendCode(
        {'mobile': phone},
      );
      if (response?.status ?? false) {
        return response;
      }
      ToastComponent.show(
        response?.message ?? '',
      );
      return null;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }

  static Future<TokenResponse?> loginValidateCode(
      String phone, String code) async {
    try {
      TokenResponse? response =
          await ApiClient().retrofitClient.loginValidateCode(
        {
          'mobile': phone,
          'code': code,
        },
      );
      if (response?.status ?? false) {
        return response;
      }
      ToastComponent.show(
        response?.message ?? '',
      );
      return null;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }

  static Future<void> refreshToken() async {}
}
