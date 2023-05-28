

import 'package:restaurant/entities/category.dart';

import '../base/api_response.dart';
import '../base/base_repository.dart';
import '../entities/pageable.dart';
import '../network/RestaurantDio.dart';

class CanteenRepository extends BaseRepository{
  // get the category list by board id
  Future<ApiResponse<ApiResponseData<Category>>> getCategoryListByBoardId(int boardId) async{
    final res = await RestaurantDio().dio.get("/board/$boardId");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Category.fromJson(e)).toList()));
  }

}