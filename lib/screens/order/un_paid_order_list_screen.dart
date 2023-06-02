import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/un_paid_order_list_provider.dart';

import '../../components/order_widget.dart';
import '../../components/refresh_list_component.dart';

class UnPaidOrderListScreen extends StatelessWidget {
  const UnPaidOrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "未支付订单",
          style: TextStyle(
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
      ),
      body: Consumer<UnPaidOrderListProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              const OrdersListComponent(),
              Positioned(
                bottom: 14.px3pt,
                left: 24.px3pt,
                child: Container(
                  padding: EdgeInsets.only(left: 16.px3pt, bottom: 4.px3pt),
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Text(
                    '\$${provider.getOrderTotalPrice()}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.payForOrderList();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.px3pt,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class OrdersListComponent extends StatefulWidget {
  const OrdersListComponent({Key? key}) : super(key: key);

  @override
  State<OrdersListComponent> createState() => _OrdersListComponentState();
}

class _OrdersListComponentState extends State<OrdersListComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UnPaidOrderListProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<UnPaidOrderListProvider>(
          provider: provider,
          itemBuilder: (item) => OrderItemCard(
            key: Key((item as CartItem).id.toString()),
            cartItem: item,
          ),
        );
      },
    );
  }
}
