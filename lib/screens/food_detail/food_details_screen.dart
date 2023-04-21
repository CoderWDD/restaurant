import 'package:flutter/material.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../components/card_widgets.dart';
import '../../md3/color_schemes.g.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                // handle back button press
                routers.pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  // handle favorite button press
                },
              ),
            ],
            centerTitle: true,
            title: const Text('Food details'),
            pinned: true,
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 14.px3pt, top: 14.px3pt),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food name',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8.px3pt),
                  Text(
                    '\$26.99',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  SizedBox(height: 14.px3pt),
                  Text(
                    'Food price',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 14.px3pt, right: 14.px3pt, top: 30.px3pt),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14.px3pt, bottom: 14.px3pt),
                    child: SizedBox(
                      height: 100.px3pt,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return const IngredientsCard(
                            ingredientUrl:
                                'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg',
                            ingredientName: 'name',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px3pt),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Add the item to the cart
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0.px3pt),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.px3pt),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 24.px3pt,
                  ),
                  SizedBox(width: 8.px3pt),
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16.px3pt,
                      fontFamily: 'PoppinsSemiBold',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
