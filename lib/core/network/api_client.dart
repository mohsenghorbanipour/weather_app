import 'dart:async';
import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/network/dio_connectivity_request_retrier.dart';
import 'package:weather_app/core/network/retrofit_client.dart';
import 'package:weather_app/core/network/retry_on_connection_change_interceptor.dart';
import 'package:weather_app/core/utils/logger_helper.dart';

class ApiClient {
  factory ApiClient() => _instance;

  ApiClient._init() {
    initDio();
  }

  initDio() {
    dio
      ..interceptors.clear()
      ..interceptors.add(
        InterceptorsWrapper(
          onError: onError,
          onRequest: onRequest,
          onResponse: onResponse,
        ),
      )
      ..interceptors.add(
        RetryOnConnectionChangeInterceptor(
          requestRetrier: DioConnectivityRequestRetrier(
            dio: dio,
          ),
        ),
      );
    retrofitClient = RetrofitClient(dio);
  }

  late final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      validateStatus: (status) => status! < 500,
      sendTimeout: const Duration(seconds: 30),
    ),
  );
  late final RetrofitClient retrofitClient;
  Future<void>? isWorking;

  static final ApiClient _instance = ApiClient._init();

  void setToken(String accessToken) {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  void onError(DioException error, ErrorInterceptorHandler handler) {
    log(request: error.requestOptions, response: error.response, error: error);
    handler.next(error);
  }

  void onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) {
    log(request: requestOptions);
    handler.next(requestOptions);
  }

  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    log(request: response.requestOptions, response: response);
    handler.next(response);
  }

  void log(
      {RequestOptions? request,
      Response<dynamic>? response,
      DioException? error}) async {
    Map<String, dynamic> logData = <String, dynamic>{
      if (request != null)
        'request': <String, dynamic>{
          'method': request.method,
          'path': request.path,
          if (request.contentType != 'multipart/form-data')
            'data': request.data,
          'queryParameters': request.queryParameters,
          'headers': request.headers,
        },
      if (response != null)
        'response': <String, dynamic>{
          'data': response.data,
          'statusCode': response.statusCode,
        },
      if (error != null)
        'error': <String, dynamic>{
          'type': error.type.toString(),
          'error': error.error.toString(),
          'message': error.message,
        }
    };
    if (error != null) {
      LoggerHelper.errorLog(logData, StackTrace.empty);
    } else {
      LoggerHelper.logger.i(logData);
    }
  }

  static Future<Response<dynamic>> retry(
      Dio dio, RequestOptions requestOptions) async {
    final Options options = Options(
      method: requestOptions.method,
      headers: dio.options.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
