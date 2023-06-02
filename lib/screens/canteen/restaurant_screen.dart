import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/card_widgets.dart';
import 'package:restaurant/entities/canteen.dart';
import 'package:restaurant/entities/category.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/restaurant_provider.dart';

import '../../constants/router_constants.dart';
import '../../go_router_data.dart';
import '../../routers.dart';

class RestaurantScreen extends StatefulWidget {
  final Canteen canteen;

  const RestaurantScreen({Key? key, required this.canteen}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int _currentSelectedRow = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, _) {
        if (!provider.checkHasData()) {
          provider.getDataListByCanteenId(widget.canteen.id);
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  title: Text(widget.canteen.name),
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      // handle back button press
                      routers.pop();
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0.px3pt),
                          bottomRight: Radius.circular(24.0.px3pt),
                        ),
                        color: Theme.of(context).colorScheme.surface,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            widget.canteen.image ??
                                'https://picsum.photos/800/600',
                            fit: BoxFit.contain,
                          ).image,
                        ),
                      ),
                    ),
                  ),
                  expandedHeight: 320.px3pt,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  iconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  elevation: 4.0,
                  toolbarTextStyle: Theme.of(context)
                      .textTheme
                      .apply(
                        bodyColor: Theme.of(context).colorScheme.onSurface,
                        displayColor: Theme.of(context).colorScheme.onSurface,
                      )
                      .bodyMedium,
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .apply(
                        bodyColor: Theme.of(context).colorScheme.onSurface,
                        displayColor: Theme.of(context).colorScheme.onSurface,
                      )
                      .titleLarge,
                ),
              ];
            },
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return getRow(provider.categoryList[index], () {
                          setState(() {
                            _currentSelectedRow = index;
                            provider.selectCategory(index);
                          });
                        }, isSelected: _currentSelectedRow == index);
                      },
                      itemCount: provider.categoryList.length,
                    )),
                Expanded(
                  flex: 5,
                  child: getDishListByCategory(
                      provider.categoryList[provider.selectedCategoryIndex]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getRow(Category category, Function onTap, {required bool isSelected}) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : Colors.white,
        child: Text(
          category.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 16.px3pt,
                fontFamily: 'PoppinsSemiBold',
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  Widget getDishListByCategory(Category category) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: category.dishSet.length,
      itemBuilder: (context, index) {
        final item = category.dishSet[index];
        return DishCard(
          key: Key(item.id.toString()),
          onTap: () {
            routers.push(FOOD_DETAILS_SCREEN,
                extra: GoRouterData(query: item.toJson()));
          },
          title: item.name,
          description: item.description,
          price: item.price.toString(),
          url: item.image,
        );
      },
    );
  }
}
