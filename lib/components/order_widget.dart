import 'package:flutter/material.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../entities/bill.dart';

class OrderItemCard extends StatelessWidget {
  final DetailEntity detailEntity;
  final VoidCallback? onLongPress;

  const OrderItemCard({Key? key, required this.detailEntity, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.px3pt, vertical: 8.px3pt),
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.px3pt),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(13.px3pt),
        onLongPress: onLongPress ?? () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4.px3pt),
              child: SizedBox(
                width: 76.px3pt,
                height: 76.px3pt,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.px3pt),
                  child: Image.network(
                    detailEntity.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailEntity.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      detailEntity.dishFlavor ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.px3pt),
              child: Text(
                "\$${detailEntity.amount}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.px3pt),
              child: Text(
                "x${detailEntity.number}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderContainer extends StatelessWidget {
  final BillEntity bill;
  final Function(BillEntity billEntity) onTap;

  const OrderContainer({Key? key, required this.bill, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.px3pt),
      child: Card(
        child: InkWell(
          onTap: (){
            onTap(bill);
          },
          borderRadius: BorderRadius.circular(13.px3pt),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '订单详情',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bill.orderTime,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '菜品:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bill.detailSet.length,
                  itemBuilder: (context, index) {
                    DetailEntity detail = bill.detailSet[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(13.px3pt),
                        child: Image.network(
                          detail.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(detail.name),
                      subtitle: Text('价格: \$${detail.amount} * ${detail.number}'),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '总价: \$${bill.amount}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
