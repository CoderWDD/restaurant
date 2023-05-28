import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/entities/QRResEntity.dart';
import 'package:restaurant/viewmodel/canteen_provider.dart';

import '../../constants/router_constants.dart';
import '../../go_router_data.dart';
import '../../routers.dart';

class CanteenDetailsScreen extends StatefulWidget {
  final QRResEntity qrResEntity;

  const CanteenDetailsScreen({
    super.key,
    required this.qrResEntity,
  });

  @override
  State<CanteenDetailsScreen> createState() => _CanteenDetailsScreenState();
}

class _CanteenDetailsScreenState extends State<CanteenDetailsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<CanteenProvider>(context, listen: false)
        .getDataListByBoardId(widget.qrResEntity.tableId);
  }

  @override
  Widget build(BuildContext pageContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.qrResEntity.canteenName),
        centerTitle: true,
      ),
      body: Consumer<CanteenProvider>(
        builder: (context, provider, _) {
          final categories = provider.dataList;
          final selectedIndex = provider.selectedCategoryIndex;
          return Row(
            children: [
              SizedBox(
                width: 150,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(categories[index].name),
                      onTap: () => provider.selectCategory(index),
                      selected: selectedIndex == index,
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.selectedCategoryDishes.length,
                  itemBuilder: (context, index) {
                    final dish = provider.selectedCategoryDishes[index];
                    return ListTile(
                      leading: Image.network(dish.image,
                          width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(dish.name),
                      subtitle: Text(dish.description),
                      trailing: Text('\$${dish.price.toStringAsFixed(2)}'),
                      onTap: () {
                        routers.push(FOOD_DETAILS_SCREEN,
                            extra: GoRouterData(query: dish.toJson()));
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
