import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/base/base_box.dart';
import 'package:weather_app/core/components/toast_component.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/core/resources/cache/config_box.dart';
import 'package:weather_app/core/utils/logger_helper.dart';
import 'package:weather_app/modules/auth/data/models/send_code_response.dart';
import 'package:weather_app/modules/auth/data/models/token_response.dart';
import 'package:weather_app/modules/auth/data/remote/auth_remote_provider.dart';

class AuthBloc extends ChangeNotifier {
  // === Singleton Class === //

  factory AuthBloc() => _instance;
  static final AuthBloc _instance = AuthBloc._init();
  AuthBloc._init();

  // ====== //

  // === Variables === //

  bool loading = false;
  String? phone, code;

  final TextEditingController otpController = TextEditingController();

  final BaseBox<TokenResponse> authBox =
      BaseBox<TokenResponse>('authenticate_box');
  TokenResponse? _tokenResponse;

  // === init data === //
  Future<void> init() async {
    try {
      await authBox.open();
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }

  // === login send code request === //
  Future<bool> loginSendCode(String phone) async {
    loading = true;
    notifyListeners();
    try {
      SendCodeResponse? response =
          await AuthRemoteProvider.loginSendCode(phone);
      if (response != null) {
        this.phone = phone;
        code = response.code ?? '';
        loading = false;
        notifyListeners();
        otpController.text = response.code ?? '';
        return true;
      }
      loading = false;
      notifyListeners();
      return false;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      loading = false;
      notifyListeners();
      ToastComponent.show('An error occurred');
      return false;
    }
  }

  // === login validate code === //
  Future<bool> loginValidateCode() async {
    loading = true;
    notifyListeners();
    try {
      TokenResponse? response = await AuthRemoteProvider.loginValidateCode(
        phone ?? '',
        code ?? '',
      );
      if (response != null) {
        authenticateUser(response);
        loading = false;
        notifyListeners();
        ConfigBox.setConfig('login-date', DateTime.now().toIso8601String());
        return true;
      }
      loading = false;
      notifyListeners();
      return false;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      loading = false;
      notifyListeners();
      ToastComponent.show('An error occurred');
      return false;
    }
  }

  // === refresh token === //
  Future<void> refreshToken() async {
    try {
      
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      ToastComponent.show('An error occurred');
    }
  }

  // === check is authenticated user === //
  Future<bool> isAuthenticated() async {
    try {
      if (authBox.isNotEmpty) {
        _tokenResponse = await authBox.first();
        String? latestLoginDate = await ConfigBox.getConfig('login-date');
        if (latestLoginDate?.isNotEmpty ?? false) {
          DateTime dateTime = DateTime.parse(latestLoginDate ?? '');
          int min = dateTime.difference(DateTime.now()).inMinutes;
          if (min >= 60) {
            // refresh token
          }
        } else {
          // refreah token
        }
        return true;
      }
      return false;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      authBox.clear();
      return false;
    }
  }

  // === Store date === //
  void authenticateUser(TokenResponse tokenResponse) {
    try {
      authBox.clear();
      authBox['main'] = tokenResponse;
      _tokenResponse = tokenResponse;
      ApiClient().setToken(_tokenResponse?.token ?? '');
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }
}
