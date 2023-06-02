

import 'package:restaurant/repository/restaurant_repository.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/category.dart';
import '../entities/dish.dart';

class RestaurantProvider extends BaseViewModel<RestaurantRepository, Category>{
  @override
  RestaurantRepository createRepository() => RestaurantRepository();

  @override
  Future<void> getDataList() async{}

  bool _hasData = false;

  List<Category> categoryList = <Category>[];
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  List<Dish> get selectedCategoryDishes => categoryList[_selectedCategoryIndex].dishSet;

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  bool checkHasData() => _hasData;

  Future<void> getDataListByCanteenId(int canteenId) async{
    categoryList.clear();
    resetDataFetch();
    _hasData = false;
    setViewState(ViewState.loading);
    // get the category list by board id
    final res = await repository.getCategoryListByCanteenId(canteenId);
    if (res.data == null) {
      setViewState(ViewState.error);
      notifyListeners();
      return;
    }
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      _hasData = true;
      // set the category list
      categoryList.clear();
      if (res.data?.content != null) categoryList.addAll(res.data?.content as Iterable<Category>);
    }
    notifyListeners();
  }
}