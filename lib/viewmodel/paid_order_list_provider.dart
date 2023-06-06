import 'package:restaurant/entities/bill.dart';

import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/cart.dart';
import '../repository/order_repository.dart';

class PaidOrderListProvider extends BaseViewModel<OrderRepository, BillEntity> {
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
    final res = await repository.getPaidOrdersList(page: currentPage, size: pageSize);
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

}