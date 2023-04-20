
import 'package:restaurant/base/base_viewmodel.dart';
import 'package:restaurant/repository/order_repository.dart';

class OrderViewModel extends BaseViewModel<OrderRepository>{
  @override
  OrderRepository createRepository() => OrderRepository();


}