

import 'package:restaurant/entities/canteen.dart';
import 'package:restaurant/repository/home_restaurant_repository.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';

class HomeRestaurantListProvider extends BaseViewModel<HomeRestaurantRepository, Canteen> {
  @override
  HomeRestaurantRepository createRepository() => HomeRestaurantRepository();

  // get all the dish list
  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getRecommendedRestaurantList(size: pageSize);
    if (res.data == null) {
      setViewState(ViewState.error);
      notifyListeners();
      return;
    }
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dataList.clear();
      dataList.addAll(res.data!.content);
      currentPage = res.data!.pageable.pageNumber + 1;
      hasMoreData = res.data!.pageable.pageNumber < res.data!.totalPages;
    }
    notifyListeners();
  }
}