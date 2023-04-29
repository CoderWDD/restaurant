

import 'package:restaurant/entities/canteen.dart';
import 'package:restaurant/repository/restaurant_repository.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';

class HomeRestaurantListProvider extends BaseViewModel<RestaurantRepository> {
  @override
  RestaurantRepository createRepository() => RestaurantRepository();
  List<Canteen> canteenList = [];
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;

  // get all the dish list
  Future<void> getNextCanteenList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getRecommendedRestaurantList(size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) canteenList.clear();
      canteenList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }
}