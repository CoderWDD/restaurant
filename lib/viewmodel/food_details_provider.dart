
import 'dart:ffi';

import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/repository/order_repository.dart';

import '../base/view_state.dart';
import '../entities/order.dart';

class FoodDetailsProvider extends BaseViewModel<OrderRepository, Void>{
  @override
  OrderRepository createRepository() => OrderRepository();

  Future<void> addToCart(Order order) async {
    setViewState(ViewState.loading);
    final res = await repository.addToCart(order);
    setViewStateByRes(res, successCode: 1);
    notifyListeners();
  }

  @override
  Future<void> getDataList() async{}

}