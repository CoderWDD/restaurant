import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/base/view_state.dart';
import 'package:restaurant/components/refresh_list_component.dart';
import 'package:restaurant/entities/canteen.dart';
import 'package:restaurant/entities/dish.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/home_restaurant_list_provider.dart';
import '../../components/card_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../constants/assets_constants.dart';
import '../../constants/router_constants.dart';
import '../../go_router_data.dart';
import '../../viewmodel/canteen_provider.dart';
import '../../viewmodel/home_dish_list_view_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 14.px3pt, right: 14.px3pt),
              child: SearchTrackingWidget(
                // TODO: add the search event handler here
                onChangeCallback: (value) {},
                onSearchCallback: () {},
                hintText: '',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 7.px3pt),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16.px3pt),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promotions',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 16.px3pt,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        IconButton(
                          // TODO: slide to the right of promotions list
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            arrowsIllustration,
                            fit: BoxFit.none,
                            width: 10.px3pt,
                            height: 18.px3pt,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TODO: add a listview.builder here
                  Padding(
                    padding: EdgeInsets.only(left: 14.px3pt, right: 14.px3pt),
                    child: SizedBox(
                      height: 96.px3pt,
                      child: const RestaurantListComponent(),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            expandedHeight: 0,
            title: Text(
              'Menu',
              style: TextStyle(
                fontSize: 16.px3pt,
                fontWeight: FontWeight.w500,
                fontFamily: 'PoppinsSemiBold',
              ),
            ),
          ),
        ];
      },
      body: const DishListComponent(),
    );
  }
}

class RestaurantListComponent extends StatefulWidget {
  const RestaurantListComponent({Key? key}) : super(key: key);

  @override
  State<RestaurantListComponent> createState() =>
      _RestaurantListComponentState();
}

class _RestaurantListComponentState extends State<RestaurantListComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeRestaurantListProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<HomeRestaurantListProvider>(
          provider: provider,
          scrollDirection: Axis.horizontal,
          itemBuilder: (item) => PromotionsCard(
            title: (item as Canteen).name,
            description: item.description,
            address: item.address,
            onTap: () {
              // todo switch to the restaurant page
              // Provider.of<CanteenProvider>(context, listen: false).getDataListByBoardId(item.id);
              // Navigator.pushNamed(context, '/canteen', arguments: res);
            },
          ),
        );
      },
    );
  }
}

class DishListComponent extends StatefulWidget {
  const DishListComponent({super.key});

  @override
  State<DishListComponent> createState() => _DishListComponentState();
}

class _DishListComponentState extends State<DishListComponent> {


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDishListProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<HomeDishListProvider>(
          provider: provider,
          itemBuilder: (item) => DishCard(
            key: Key((item as Dish).id.toString()),
            onTap: () {
              routers.push(FOOD_DETAILS_SCREEN,
                  extra: GoRouterData(query: item.toJson()));
            },
            title: item.name,
            description: item.description,
            price: item.price.toString(),
            url: item.image,
          ),
        );
      },
    );
  }
}
