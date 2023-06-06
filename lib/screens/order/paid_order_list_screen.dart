

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/order_widget.dart';
import '../../components/refresh_list_component.dart';
import '../../entities/bill.dart';
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
          return const PaidOrdersListComponent();
        },
      ),
    );
  }
}


class PaidOrdersListComponent extends StatefulWidget {
  const PaidOrdersListComponent({Key? key}) : super(key: key);

  @override
  State<PaidOrdersListComponent> createState() => _PaidOrdersListComponentState();
}

class _PaidOrdersListComponentState extends State<PaidOrdersListComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaidOrderListProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<PaidOrderListProvider>(
          provider: provider,
          itemBuilder: (item) => OrderContainer(
            key: Key((item as BillEntity).id.toString()),
            bill: item,
            onTap: (bill) {

            },
          ),
        );
      },
    );
  }
}