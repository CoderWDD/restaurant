
import 'package:restaurant/base/base_repository.dart';

class FavoriteRepository extends BaseRepository{
  // get the favorite list
  // Future<ApiResponse<ApiResponseData<Favorite>>> getFavoriteList({int page = 1, int size = 10}) async{
  //   // get the favorite list
  //   final res = await dio.get("/favorite/$page/$size", );
  //   return ApiResponse.fromJson(res.data, (data) => ApiResponseData.fromJson(data, (content) => (content as List).map((e) => Favorite.fromJson(e)).toList()));
  // }
}