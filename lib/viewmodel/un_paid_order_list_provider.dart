

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/bill.dart';
import '../repository/order_repository.dart';

class UnPaidOrderListProvider extends BaseViewModel<OrderRepository, BillEntity> {
  @override
  OrderRepository createRepository() => OrderRepository();

  @override
  Future<void> getDataList() async {
    setViewState(ViewState.loading);
    if (isFirstLoad) resetDataFetch();
    if (!hasMoreData) {
      setViewState(ViewState.success);
      return;
    }
    final res = await repository.getUnpaidOrdersList(page: currentPage, size: pageSize);
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
      pageSize = res.data!.pageable.pageSize;
      hasMoreData = res.data!.pageable.pageNumber < res.data!.totalPages;
    }
    notifyListeners();
  }

  // pay the cart item list
  Future<void> payForOrderList(int id) async {
    final res = await repository.payOrders(id);
    setViewStateByRes(res, successCode: 1);
    resetDataFetch();
    dataList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  // get order list total price
  // double getOrderTotalPrice(){
  //   double res = 0;
  //   for (var cartItem in dataList) {
  //     res += cartItem.amount * cartItem.number;
  //   }
  //   return res;
  // }
}