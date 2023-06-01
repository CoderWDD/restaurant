

import 'dart:ffi';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../repository/order_repository.dart';

class UnServeCartListProvider extends BaseViewModel<OrderRepository, Void> {
  @override
  OrderRepository createRepository() => OrderRepository();



  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    // get the cart list
    final res = await repository.getCartList(page: currentPage, size: pageSize);
    if (res.data == null) {
      setViewState(ViewState.error);
      notifyListeners();
      return;
    }
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dataList.clear();
      // dataList.addAll(res.data!.content);
      currentPage = res.data!.pageable.pageNumber + 1;
      pageSize = res.data!.pageable.pageSize;
      hasMoreData = res.data!.pageable.pageNumber < res.data!.totalPages;
    }
    notifyListeners();
  }
}