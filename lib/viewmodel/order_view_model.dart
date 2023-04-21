
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/entities/dish.dart';
import 'package:restaurant/entities/pageable.dart';
import 'package:restaurant/repository/order_repository.dart';

import '../base/view_state.dart';

class OrderViewModel extends BaseViewModel<OrderRepository>{
  @override
  OrderRepository createRepository() => OrderRepository();

  // get all the dish list
  Future<ApiResponseData<Dish>?> getAllDishList({int page = 1, int size = 10}) async {
    setViewState(ViewState.loading);
    // get all the dish list
    final res = await repository.getAllDishList(page: page, size: size);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      return res.data;
    }
    return null;
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

  // get the category list by canteen
  Future<ApiResponseData<Category>?> getCategoryListByCanteen(String canteenId) async {
    setViewState(ViewState.loading);
    // get the category list by canteen
    final res = await repository.getCategoryListByCanteen(canteenId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      return res.data;
    }
    return null;
  }

  // get the category list by board
  Future<ApiResponseData<Category>?> getCategoryListByBoard(String boardId) async {
    setViewState(ViewState.loading);
    // get the category list by board
    final res = await repository.getCategoryListByBoard(boardId);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      return res.data;
    }
    return null;
  }
}