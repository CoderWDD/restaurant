

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// The log interceptor for debugging
class LogcatInterceptor extends Interceptor {
  LogcatInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
  });

  final bool request;
  final bool requestHeader;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;
  final bool error;
  late final void Function(Object object, {bool isError}) logPrint = logPrintFunction;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (request) {
      logPrint('*** Request ***');
      logPrint('${options.method} ${options.uri}');

      if (requestHeader) {
        logPrint('Headers:');
        options.headers.forEach((key, value) => logPrint('$key: $value'));
      }

      if (requestBody && options.method != 'GET') {
        logPrint('Request Body:');
        logPrint(_prettyPrint(options.data));
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (responseHeader) {
      logPrint('*** Response ***');
      logPrint('Status Code : ${response.statusCode}');

      logPrint('Headers:');
      response.headers.forEach((key, value) => logPrint('$key: $value'));
    }

    if (responseBody && response.data != null) {
      logPrint('Response Body:');
      logPrint(_prettyPrint(response.data));
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      logPrint('*** DioError ***:');
      logPrint('uri: ${err.requestOptions.uri}');
      logPrint('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
    }
    super.onError(err, handler);
  }

  void _printResponse(Response response) {
    if (responseHeader) {
      logPrint('*** Response ***');
      logPrint('Status Code : ${response.statusCode}');

      logPrint('Headers:');
      response.headers.forEach((key, value) => logPrint('$key: $value'));
    }

    if (responseBody && response.data != null) {
      logPrint('Response Body:');
      logPrint(_prettyPrint(response.data));
    }
  }

  String _prettyPrint(Object? object) {
    if (object == null) {
      return '';
    } else if (object is String) {
      try {
        object = json.decode(object);
      } catch (_) {}
    }
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(object);
  }

  void logPrintFunction(Object object, {bool isError = false}) {
    if (kDebugMode) {
      print(isError ? 'Error: $object' : object);
    }
  }
}
