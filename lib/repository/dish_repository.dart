
import '../base/api_response.dart';
import '../base/base_repository.dart';
import '../entities/Order.dart';
import '../entities/dish.dart';
import '../entities/pageable.dart';
import '../network/RestaurantDio.dart';

class DishRepository extends BaseRepository {
  // Get a list of dishes served
  Future<ApiResponse<List<Order>>> getDishListServed({int page = 1, int size = 10}) async{
    // Get a list of dishes served
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size/1", );
    return ApiResponse.fromJson(res.data, (data) => data.map<Order>((item) => Order.fromJson(item)).toList());
  }

  // Get a list of dishes does not served
  Future<ApiResponse<List<Order>>> getUnservedDishList({int page = 1, int size = 10}) async{
    // Get a list of dishes does not served
    final res = await RestaurantDio().dio.get("/shoppingCart/$page/$size/0", );
    return ApiResponse.fromJson(res.data, (data) => data.map<Order>((item) => Order.fromJson(item)).toList());
  }

  // get all the dish list
  Future<ApiResponse<ApiResponseData<Dish>>> getAllDishList({int page = 1, int size = 10}) async{
    final res = await RestaurantDio().dio.get("/dish/$page/$size", );
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Dish.fromJson(e)).toList()));
  }

  // get the dish list by category
  Future<ApiResponse<ApiResponseData<Dish>>> getDishListByCategory(String categoryId, {int page = 1, int size = 10}) async{
    final res = await RestaurantDio().dio.get("/dish/$categoryId/$page/$size");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Dish.fromJson(e)).toList()));
  }
}