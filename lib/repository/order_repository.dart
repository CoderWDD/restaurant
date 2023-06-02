
import 'dart:convert';

import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/entities/pageable.dart';
import 'package:restaurant/network/RestaurantDio.dart';
import '../base/api_response.dart';
import '../entities/order.dart';

class OrderRepository extends BaseRepository{
  // add the order to cart
  Future<ApiResponse<String>> addToCart(Order order) async{
    // add the order to cart
    final res = await RestaurantDio().dio.get("/shoppingCart/add", queryParameters: order.toJson());
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // delete the order from cart
  Future<ApiResponse<String>> deleteFromCart(int orderId) async{
    // delete the order from cart
    final res = await RestaurantDio().dio.delete("/shoppingCart/$orderId");
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // get the order list of cart
  Future<ApiResponse<ApiResponseData<Order>>> getOrderList({int page = 1, int size = 10}) async{
    // get the order list of cart
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size", );
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Order.fromJson(e)).toList()));
  }

  // place an order
  Future<ApiResponse<String>> placeOrder(List<String> orderList) async{
    // place an order
    final res = await RestaurantDio().dio.post("/shoppingCart", data: jsonEncode(orderList));
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // order the cart item list
  Future<ApiResponse<String>> orderCartItemList(List<int> orderList) async{
    // pay the order
    Map<String, List<int>> map = {};
    map["list"] = orderList;
    final res = await RestaurantDio().dio.post("/shoppingCart", data: map);
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // pay the orders
  Future<ApiResponse<String>> payOrders() async{
    final res = await RestaurantDio().dio.get("/shoppingCart");
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // get the cart list
  Future<ApiResponse<ApiResponseData<CartItem>>> getCartList({int page = 1, int size = 10}) async{
    // get the cart list
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => CartItem.fromJson(e)).toList()));
  }

  // get the served cart list
  Future<ApiResponse<ApiResponseData<CartItem>>> getServedCartList({int page = 1, int size = 10}) async{
    // get the cart list
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size/1");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => CartItem.fromJson(e)).toList()));
  }

  // get the un served cart list
  Future<ApiResponse<ApiResponseData<CartItem>>> getUnServedCartList({int page = 1, int size = 10}) async{
    // get the cart list
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size/0", );
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => CartItem.fromJson(e)).toList()));
  }

  // get the list of unpaid orders
  Future<ApiResponse<ApiResponseData<CartItem>>> getUnpaidOrdersList({int page = 1, int size = 10}) async {
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => CartItem.fromJson(e)).toList()));
  }

  // get the list of paid orders
  Future<ApiResponse<ApiResponseData<CartItem>>> getPaidOrdersList({int page = 1, int size = 10}) async {
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => CartItem.fromJson(e)).toList()));
  }

  // get the unpaid order list
  Future<ApiResponse<List<Order>>> getUnpaidOrderList({int page = 1, int size = 10}) async{
    // get the unpaid order list
    final res = await RestaurantDio().dio.get("/order/unpaid/$page/$size}", );
    return ApiResponse.fromJson(res.data, (data) => data.map<Order>((item) => Order.fromJson(item)).toList());
  }

  // get the paid order list
  Future<ApiResponse<List<Order>>> getPaidOrderList({int page = 1, int size = 10}) async{
    // get the paid order list
    final res = await RestaurantDio().dio.get("/order/paid/$page/$size}", );
    return ApiResponse.fromJson(res.data, (data) => data.map<Order>((item) => Order.fromJson(item)).toList());
  }

  // delete the order from cart or unpaid order list
  Future<ApiResponse<String>> deleteOrder(int orderId) async{
    // delete the order from cart or unpaid order list
    final res = await RestaurantDio().dio.delete("/shoppingCart/$orderId");
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }



  // get the category list by board id
  // 顾客绑定餐桌并且返回菜单分类
  Future<ApiResponse<ApiResponseData<Category>>> getCategoryListByBoard(String boardId) async{
    final res = await RestaurantDio().dio.get("/board/$boardId");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Category.fromJson(e)).toList()));
  }

  // get the category list by canteen id
  Future<ApiResponse<ApiResponseData<Category>>> getCategoryListByCanteen(String canteenId) async{
    final res = await RestaurantDio().dio.get("/category/$canteenId");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Category.fromJson(e)).toList()));
  }
}