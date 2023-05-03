
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/entities/dish.dart';
import 'package:restaurant/repository/canteen_repository.dart';

class CanteenProvider extends BaseViewModel<CanteenRepository, Dish>{
  @override
  CanteenRepository createRepository() => CanteenRepository();

  @override
  Future<void> getDataList() async{
    // TODO: implement getDataList
    throw UnimplementedError();
  }

  List<Category>? categoryList = <Category>[];

  Future<void> getDataListByBoardId(int boardId) async{
    // get the category list by board id
    final res = await repository.getDishListByBoardId(boardId);
    // set the category list
    categoryList = res.data?.content;
    notifyListeners();
  }
}