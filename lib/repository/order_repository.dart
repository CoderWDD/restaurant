
import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/entities/Order.dart';
import 'package:restaurant/network/RestaurantDio.dart';

import '../base/api_response.dart';

class OrderRepository extends BaseRepository{
  // add the order to cart
  Future<ApiResponse<String>> addToCart(Order order) async{
    // add the order to cart
    final res = await RestaurantDio().dio.get("/shoppingCart/add", queryParameters: order.toJson());
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // pay the order
  Future<ApiResponse<String>> payOrder(Order order) async{
    // pay the order
    final res = await RestaurantDio().dio.get("/shoppingCart", queryParameters: order.toJson());
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }
}