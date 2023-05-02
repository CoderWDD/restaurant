

import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/favorite.dart';
import 'package:restaurant/repository/favorite_repository.dart';

import '../base/view_state.dart';

class HomeFavoriteProvider extends BaseViewModel<FavoriteRepository, Favorite>{
  @override
  FavoriteRepository createRepository() => FavoriteRepository();

  bool hasFavorite = false;
  bool hasBeenLoaded = false;

  // add a favorite
  Future<void> addFavorite(int dishId) async {
    setViewState(ViewState.loading);
    // add a favorite
    final res = await repository.addFavorite(dishId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      hasBeenLoaded = true;
      hasFavorite = true;
    }
      notifyListeners();
  }

  // delete a favorite
  Future<void> deleteFavorite(int dishId) async {
    setViewState(ViewState.loading);
    // delete a favorite
    final res = await repository.deleteFavorite(dishId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      hasBeenLoaded = true;
      hasFavorite = false;
      dataList.removeWhere((element) => element.dishId == dishId);
    }
    notifyListeners();
  }

  // get all the dish list
  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getFavoriteList(size: pageSize);
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