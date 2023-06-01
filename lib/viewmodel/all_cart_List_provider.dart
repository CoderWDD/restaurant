

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

  void selectCartItem(CartItem cartItem) {
    for (var item in dataList) {
      if (item.id == cartItem.id) {
        item.isSelected = !(item.isSelected ?? true);
      }
    }
    notifyListeners();
  }

  bool checkIfSelectedItem(CartItem cartItem) {
    for (var item in dataList) {
      if (item.id == cartItem.id) {
        return item.isSelected ?? false;
      }
    }
    return false;
  }

  // delete item from cart
  Future<void> deleteCartItem(int cartItemId) async {
    // delete the cart item
    final res = await repository.deleteFromCart(cartItemId);
    if (res.data == null) {
      setViewState(ViewState.error);
      notifyListeners();
      return;
    }
    // delete the cart item from the list
    for (var item in dataList) {
      if (item.id == cartItemId) {
        dataList.remove(item);
        break;
      }
    }
    notifyListeners();
  }

  // get the total price of the selected cart items
  double getSelectedTotalPrice() {
    double totalPrice = 0;
    for (var item in dataList) {
      if (item.isSelected ?? false) {
        totalPrice += item.amount * item.number;
      }
    }
    return totalPrice;
  }

}
