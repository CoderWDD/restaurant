

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/home_favorite_list_provider.dart';
import 'package:restaurant/viewmodel/home_restaurant_list_provider.dart';

import '../../base/view_state.dart';
import '../../components/favorite_widget.dart';

class LikeTab extends StatefulWidget {
  const LikeTab({Key? key}) : super(key: key);

  @override
  State<LikeTab> createState() => _LikeTabState();
}

class _LikeTabState extends State<LikeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: FavoriteListComponent(),
        ),
      ],
    );
  }
}

class FavoriteListComponent extends StatefulWidget {
  const FavoriteListComponent({Key? key}) : super(key: key);

  @override
  State<FavoriteListComponent> createState() => _FavoriteListComponentState();
}

class _FavoriteListComponentState extends State<FavoriteListComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => firstLoad());
  }

  void firstLoad(){
    final provider = Provider.of<HomeFavoriteProvider>(context, listen: false);
    provider.getNextFavoriteList();
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
    final provider = Provider.of<HomeFavoriteProvider>(context, listen: false);
    await provider.getNextFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeFavoriteProvider>(
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
            itemCount: provider.favoriteList.length + (provider.hasMoreData ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == provider.favoriteList.length) {
                return provider.viewState == ViewState.loading
                    ? const CircularProgressIndicator()
                    : const SizedBox();
              } else {
                final favorite = provider.favoriteList[index];
                return FavoriteCard(
                  key: Key(favorite.id.toString()),
                  favorite: favorite,
                  onFavoriteIconClick: (favorite){
                    provider.deleteFavorite(favorite.dishId);

                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
