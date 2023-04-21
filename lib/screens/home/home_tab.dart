import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/base/view_state.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/utils/px2dp.dart';
import '../../components/card_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../constants/assets_constants.dart';
import '../../constants/router_constants.dart';
import '../../go_router_data.dart';
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

class DishListComponent extends StatefulWidget {
  const DishListComponent({super.key});

  @override
  State<DishListComponent> createState() => _DishListComponentState();
}

class _DishListComponentState extends State<DishListComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => firstLoad());
  }

  void firstLoad(){
    final provider = Provider.of<HomeDishListProvider>(context, listen: false);
    provider.getNextDishList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async{
    final provider = Provider.of<HomeDishListProvider>(context, listen: false);
    await provider.getNextDishList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDishListProvider>(
      builder: (context, provider, child) {
        // if the state of the provider is loading, show a circular progress indicator
        if (provider.viewState == ViewState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // if the state of the provider is error, show an error message
        if (provider.viewState == ViewState.error) {
          return const Center(
            child: Text('Failed to fetch dishes data.'),
          );
        }

        return RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: _loadMore,
          child: ListView.builder(
            itemCount: provider.dishList.length + (provider.hasMoreData ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == provider.dishList.length) {
                return provider.viewState == ViewState.loading
                    ? const CircularProgressIndicator()
                    : const SizedBox();
              } else {
                final dish = provider.dishList[index];
                dish.toJson();
                return DishCard(
                  onTap: () {
                    routers.push(FOOD_DETAILS_SCREEN, extra: GoRouterData(query: dish.toJson()));
                  },
                  title: dish.name,
                  description: dish.description,
                  price: dish.price.toString(),
                  url: dish.image,
                );
              }
            },
          ),
        );
      },
    );
  }
}


