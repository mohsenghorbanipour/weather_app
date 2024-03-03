import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_app/core/network/dio_connectivity_request_retrier.dart';
import 'package:weather_app/core/utils/logger_helper.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  final DioConnectivityRequestRetrier requestRetrier;

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        handler.resolve(
            await requestRetrier.scheduleRequestRetry(err.requestOptions));
      } catch (e) {
        LoggerHelper.logger.e(e);
      }
    }
    handler.next(err);
  }

  bool _shouldRetry(DioException err) =>
      err.error != null && err.error is SocketException;
}
