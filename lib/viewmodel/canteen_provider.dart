
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/entities/dish.dart';
import 'package:restaurant/repository/canteen_repository.dart';

class CanteenProvider extends BaseViewModel<CanteenRepository, Category>{
  @override
  CanteenRepository createRepository() => CanteenRepository();

  @override
  Future<void> getDataList() async{}

  List<Category> categoryList = <Category>[];
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  List<Dish> get selectedCategoryDishes => categoryList[_selectedCategoryIndex].dishSet;

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  Future<void> getDataListByBoardId(int boardId) async{
    // get the category list by board id
    final res = await repository.getCategoryListByBoardId(boardId);
    // set the category list
    categoryList.clear();
    if (res.data?.content != null) categoryList.addAll(res.data?.content as Iterable<Category>);
    notifyListeners();
  }
}