

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/screens/order/un_paid_order_list_screen.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../viewmodel/paid_order_list_provider.dart';

class PaidOrderListScreen extends StatelessWidget {
  const PaidOrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "已支付订单",
          style: TextStyle(
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
      ),
      body: Consumer<PaidOrderListProvider>(
        builder: (context, provider, child) {
          return const OrdersListComponent();
        },
      ),
    );
  }
}
