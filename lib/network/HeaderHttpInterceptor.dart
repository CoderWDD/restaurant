

import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../viewmodel/auth_view_model.dart';

class HeaderHttpInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // add the authorization header if the user is logged in
    if (!options.path.contains('login') && !options.path.contains('register')){
      options.headers['Authorization'] = 'Bearer ${AuthViewModel.token}';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // get the response data
    handler.next(response);
  }
}