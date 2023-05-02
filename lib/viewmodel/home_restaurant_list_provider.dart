

import 'package:restaurant/entities/canteen.dart';
import 'package:restaurant/repository/restaurant_repository.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';

class HomeRestaurantListProvider extends BaseViewModel<RestaurantRepository, Canteen> {
  @override
  RestaurantRepository createRepository() => RestaurantRepository();

  // get all the dish list
  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getRecommendedRestaurantList(size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dataList.clear();
      dataList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }
}