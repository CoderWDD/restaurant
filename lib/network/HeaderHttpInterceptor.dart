

import 'dart:typed_data';

import 'package:dio/dio.dart';

class HeaderHttpInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add the authorization header if the user is logged in
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // get the response data
    handler.next(response);
  }
}