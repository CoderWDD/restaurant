
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/entities/pageable.dart';
import 'package:restaurant/repository/order_repository.dart';

import '../base/view_state.dart';

class OrderViewModel extends BaseViewModel<OrderRepository>{
  @override
  OrderRepository createRepository() => OrderRepository();
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