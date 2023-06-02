

import 'package:flutter/material.dart';
import 'package:restaurant/entities/cart.dart';
import 'package:restaurant/utils/px2dp.dart';

class OrderItemCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback? onLongPress;
  const OrderItemCard({Key? key, required this.cartItem, this.onLongPress}) : super(key: key);

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
                    cartItem.image,
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
                      cartItem.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cartItem.dishFlavor ?? '',
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
              child:  Text(
                "\$${cartItem.amount}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.px3pt),
              child:  Text(
                "x${cartItem.number}",
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