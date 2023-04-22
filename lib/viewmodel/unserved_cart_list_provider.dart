import '../base/base_viewmodel.dart';
import '../base/view_state.dart';
import '../entities/cart.dart';
import '../repository/order_repository.dart';

class UnServeCartListProvider extends BaseViewModel<OrderRepository> {
  @override
  OrderRepository createRepository() => OrderRepository();
  List<CartItem> cartList = [];
  int currentPage = 1;
  int pageSize = 10;
  bool hasMoreData = true;

  // get the cart list, and ignore weather the cart item is paid or not
  Future<void> getUnServedCartList() async {
    setViewState(ViewState.loading);
    // get the cart list
    final res = await repository.getUnServedCartList(page: currentPage, size: pageSize);
    setViewStateByRes(res, successCode: 1);
    if (viewState == ViewState.success) {
      if (currentPage == 1) cartList.clear();
      cartList.addAll(res.data.content);
      currentPage = res.data.pageable.pageNumber + 1;
      pageSize = res.data.pageable.pageSize;
      hasMoreData = res.data.pageable.pageNumber < res.data.totalPages;
    }
    notifyListeners();
  }
}