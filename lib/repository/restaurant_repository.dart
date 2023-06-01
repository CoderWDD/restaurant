
import '../base/api_response.dart';
import '../base/base_repository.dart';
import '../entities/category.dart';
import '../entities/pageable.dart';
import '../network/RestaurantDio.dart';

class RestaurantRepository extends BaseRepository{
  // get the category list and the dish set by canteen id
  Future<ApiResponse<ApiResponseData<Category>>> getCategoryListByCanteenId(int canteenId) async{
    final res = await RestaurantDio().dio.get("/category/$canteenId");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Category.fromJson(e)).toList()));
  }
}