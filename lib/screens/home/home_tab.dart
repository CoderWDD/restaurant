import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../components/card_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../constants/assets_constants.dart';
import '../../md3/color_schemes.g.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<String> tabTitles = [
    'Burger',
    'Burger',
    'Burger',
    'Burger',
    'Burger',
    'Burger',
    'Burger'
  ];

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
                          style: Theme.of(context).textTheme.headline6?.copyWith(
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return PromotionsCard(
                            url:
                                'https://docs.flutter.dev/assets/images/docs/ui/layout/layout-4.png',
                            title: 'Hello',
                            description: 'ssss',
                            price: "\$123.9",
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 31.px3pt,
              margin: EdgeInsets.only(top: 22.px3pt),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 14.px3pt, right: 14.px3pt),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 16.px3pt,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinsSemiBold',
                          ),
                        ),
                        // TODO: add the click event handler here
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 12.px3pt,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabLayoutDelegate(
                TabBar(
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(4.px3pt),
                    borderSide: BorderSide(
                      width: 3.px3pt,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16.px3pt),
                  ),
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  labelStyle: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    fontSize: 16.px3pt,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    fontSize: 12.px3pt,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: _tabController,
                  tabs: tabTitles
                      .map((tabTitle) => Tab(
                    text: tabTitle,
                  ))
                      .toList(),
                )
            ),
          ),
        ];
      },
      body: DefaultTabController(
        length: tabTitles.length,
        child: TabBarView(
            controller: _tabController,
            children: tabTitles
                .map(
                  (tabTitle) => ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return const CategoriesCard();
                    },
                  ),
                )
                .toList()),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: tabTitles.length, vsync: this);
  }
}

class _TabLayoutDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabLayoutDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabLayoutDelegate oldDelegate) => false;
}
