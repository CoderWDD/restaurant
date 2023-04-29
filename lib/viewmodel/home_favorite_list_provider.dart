

import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/favorite.dart';
import 'package:restaurant/repository/favorite_repository.dart';

import '../base/view_state.dart';

class HomeFavoriteProvider extends BaseViewModel<FavoriteRepository>{
  @override
  FavoriteRepository createRepository() => FavoriteRepository();

  List<Favorite> favoriteList = [];
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;

  bool hasFavorite = false;

  // get all the dish list
  Future<void> getNextFavoriteList() async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getFavoriteList(size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) favoriteList.clear();
      favoriteList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }

  // add a favorite
  Future<void> addFavorite(int dishId) async {
    setViewState(ViewState.loading);
    // add a favorite
    final res = await repository.addFavorite(dishId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) hasFavorite = true;
    notifyListeners();
  }

  // delete a favorite
  Future<void> deleteFavorite(int dishId) async {
    setViewState(ViewState.loading);
    // delete a favorite
    final res = await repository.deleteFavorite(dishId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      hasFavorite = false;
      favoriteList.removeWhere((element) => element.dishId == dishId);
    }
    notifyListeners();
  }

}