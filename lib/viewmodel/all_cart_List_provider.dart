

import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/repository/order_repository.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';

class AllCartListProvider extends BaseViewModel<OrderRepository, CartItem> {
  @override
  OrderRepository createRepository() => OrderRepository();

  // get the cart list, and ignore weather the cart item is paid or not
  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    // get the cart list
    final res = await repository.getCartList(page: currentPage, size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) dataList.clear();
      dataList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      pageSize = res.data.pageable.pageSize;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }

}
