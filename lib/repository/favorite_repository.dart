
import 'package:restaurant/base/base_repository.dart';

import '../base/api_response.dart';
import '../entities/favorite.dart';
import '../entities/pageable.dart';
import '../network/RestaurantDio.dart';

class FavoriteRepository extends BaseRepository{
  // get the favorite list
  Future<ApiResponse<ApiResponseData<Favorite>>> getFavoriteList({int page = 1, int size = 10}) async{
    // get the favorite list
    final res = await RestaurantDio().dio.get("/collect/$page/$size", );
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Favorite.fromJson(e)).toList()));
  }

  // add a favorite
  Future<ApiResponse<String>> addFavorite(int dishId) async{
    // add a favorite
    final res = await RestaurantDio().dio.get("/collect/$dishId");
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }

  // delete a favorite
  Future<ApiResponse<String>> deleteFavorite(int dishId) async{
    // delete a favorite
    final res = await RestaurantDio().dio.delete("/collect/$dishId");
    return ApiResponse.fromJson(res.data, (data) => data.toString());
  }
}