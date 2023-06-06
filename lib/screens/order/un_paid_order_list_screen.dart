import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/constants/router_constants.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/un_paid_order_list_provider.dart';

import '../../components/order_widget.dart';
import '../../components/refresh_list_component.dart';
import '../../entities/bill.dart';
import '../../go_router_data.dart';
import '../../routers.dart';

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
      body: const UnpaidOrdersListComponent(),
    );
  }
}

class UnpaidOrdersListComponent extends StatefulWidget {
  const UnpaidOrdersListComponent({Key? key}) : super(key: key);

  @override
  State<UnpaidOrdersListComponent> createState() =>
      _UnpaidOrdersListComponentState();
}

class _UnpaidOrdersListComponentState extends State<UnpaidOrdersListComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UnPaidOrderListProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<UnPaidOrderListProvider>(
          provider: provider,
          itemBuilder: (item) => OrderContainer(
            key: Key((item as BillEntity).id.toString()),
            bill: item,
            onTap: (bill) {
              routers.push(
                ORDER_DETAILS_SCREEN,
                extra: GoRouterData(query: bill.toJson()),
              );
            },
          ),
        );
      },
    );
  }
}
