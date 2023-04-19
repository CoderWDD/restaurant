import 'package:dio/dio.dart';
import 'package:restaurant/network/HeaderHttpInterceptor.dart';
import 'package:restaurant/network/log_interceptor.dart';

// the dio instance is a singleton
class RestaurantDio {
  static final RestaurantDio _instance = RestaurantDio._internal();
  static final BaseOptions options = BaseOptions(
    baseUrl: "http://113.125.103.168:8086",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),

  );
  static final Dio _dio = Dio()
    ..interceptors.add(HeaderHttpInterceptor())
    ..interceptors.add(LogcatInterceptor())
    ..options = options;

  factory RestaurantDio() {
    return _instance;
  }

  RestaurantDio._internal();

  Dio get dio => _dio;
}
