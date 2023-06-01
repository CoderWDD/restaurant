

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/dish.dart';
import '../repository/dish_repository.dart';

class HomeDishListProvider extends BaseViewModel<DishRepository, Dish> {
  @override
  DishRepository createRepository() => DishRepository();

  // get all the dish list
  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    if (isFirstLoad) resetDataFetch();
    if (!hasMoreData) {
      setViewState(ViewState.success);
      return;
    }
    // get all the dish list
    final res = await repository.getAllDishList(page: currentPage, size: pageSize);
    if (res.data == null) {
      setViewState(ViewState.error);
      notifyListeners();
      return;
    }
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dataList.clear();
      isFirstLoad = false;
      dataList.addAll(res.data!.content);
      currentPage = res.data!.pageable.pageNumber + 1;
      pageSize = res.data!.pageable.pageSize;
      hasMoreData = res.data!.pageable.pageNumber < res.data!.totalPages;
    }
    notifyListeners();
  }
}