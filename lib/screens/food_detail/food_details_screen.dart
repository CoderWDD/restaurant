import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../components/card_widgets.dart';

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
              leading: const Icon(Icons.arrow_back_ios),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
              centerTitle: true,
              title: const Text('Food details'),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0.px3pt),
                        bottomRight: Radius.circular(24.0.px3pt),
                      ),
                    ),
                    color: Colors.yellow,
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
              // add additional properties as needed
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(left: 14.px3pt, top: 14.px3pt),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food name',
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 18.px3pt,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF242321)),
                      ),
                      SizedBox(
                        height: 8.px3pt,
                      ),
                      Text(
                        '\$26.99',
                        style: TextStyle(
                          fontSize: 26.px3pt,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFFA41D),
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
                      SizedBox(
                        height: 14.px3pt,
                      ),
                      Text(
                        'Food price',
                        style: TextStyle(
                          fontSize: 14.px3pt,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF7D7871),
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ],
                  )),
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
                      style: TextStyle(
                          color: const Color(0xFF242321),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.px3pt,
                          fontFamily: 'PoppinsMedium'),
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
        body: const Center(
          child: Text('Body'),
        ),
      ),
    );
  }
}
