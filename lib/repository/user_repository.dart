import 'dart:convert';

import 'package:restaurant/base/api_response.dart';
import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/network/RestaurantDio.dart';

import '../entities/User.dart';

class UserRepository extends BaseRepository{
  Future<ApiResponse<String>> login(User user) async{
    final res = await RestaurantDio().dio.post("/user/login", data: user.toJson());
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  Future<ApiResponse<String>> register(User user) async{

    final res = await RestaurantDio().dio.post("/user/register", data: user.toJson());
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }
}