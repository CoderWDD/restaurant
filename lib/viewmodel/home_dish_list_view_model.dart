

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/dish.dart';
import '../entities/pageable.dart';
import '../repository/dish_repository.dart';

class HomeDishListProvider extends BaseViewModel<DishRepository> {
  @override
  DishRepository createRepository() => DishRepository();
  List<Dish> dishList = [];
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;

  // get all the dish list
  Future<void> getNextDishList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getAllDishList(page: currentPage, size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dishList.clear();
      dishList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      pageSize = res.data.pageable.pageSize;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }

  // get the dish list by category
  Future<ApiResponseData<Dish>?> getDishListByCategory(String categoryId, {int page = 1, int size = 10}) async {
    setViewState(ViewState.loading);
    // get the dish list by category
    final res = await repository.getDishListByCategory(categoryId, page: page, size: size);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      return res.data;
    }
    return null;
  }
}