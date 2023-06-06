import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/entities/bill.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/un_paid_order_list_provider.dart';

import '../../components/order_widget.dart';




class OrderDetailsScreen extends StatelessWidget {
  final BillEntity billEntity;

  const OrderDetailsScreen({Key? key, required this.billEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "订单详情",
          style: TextStyle(
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
      ),
      body: OrderDishListComponent(billEntity: billEntity),
    );
  }
}

class OrderDishListComponent extends StatelessWidget {
  final BillEntity billEntity;

  const OrderDishListComponent({Key? key, required this.billEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailSet = billEntity.detailSet;
    return Stack(
      children: [
        ListView.builder(
            itemCount: detailSet.length,
            itemBuilder: (
              context,
              index,
            ) {
              return OrderItemCard(
                detailEntity: detailSet[index],
              );
            }),
        Positioned(
          bottom: 14.px3pt,
          left: 24.px3pt,
          child: Container(
            padding: EdgeInsets.only(left: 16.px3pt, bottom: 4.px3pt),
            color: Theme.of(context).colorScheme.onPrimary,
            child: Text(
              '\$${billEntity.amount}',
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
                Provider.of<UnPaidOrderListProvider>(context, listen: false).payForOrderList(billEntity.id);

                routers.pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                '付款',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.px3pt,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsSemiBold',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
