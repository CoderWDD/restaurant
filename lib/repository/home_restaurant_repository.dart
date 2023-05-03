

import 'package:restaurant/base/base_repository.dart';
import 'package:restaurant/entities/canteen.dart';

import '../base/api_response.dart';
import '../entities/pageable.dart';
import '../network/RestaurantDio.dart';

class HomeRestaurantRepository extends BaseRepository{
  // get the recommended restaurant list
  Future<ApiResponse<ApiResponseData<Canteen>>> getRecommendedRestaurantList({int size = 10}) async{
    final res = await RestaurantDio().dio.get("/store/$size");
    return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Canteen.fromJson(e)).toList()));
  }
}