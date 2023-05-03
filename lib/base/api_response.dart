import 'package:restaurant/base/view_state.dart';

class ApiResponse<T> {
  final int code;
  final String message;
  final T? data;
  final Map<String, dynamic> map;

  ApiResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.map,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return ApiResponse<T>(
      code: json['code'] ?? 0,
      message: json['msg'] ?? '',
      data: fromJson(json['data']),
      map: json['map'] != null ? Map<String, dynamic>.from(json['map']) : {},
    );
  }
}