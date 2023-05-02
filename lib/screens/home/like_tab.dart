

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/refresh_list_component.dart';
import 'package:restaurant/entities/favorite.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeFavoriteProvider>(
      builder: (context, provider, child) {
        return RefreshListComponent<HomeFavoriteProvider>(provider: provider, itemBuilder: (item) => FavoriteCard(
          key: Key((item as Favorite).id.toString()),
          favorite: item,
          onFavoriteIconClick: (favorite){
            provider.deleteFavorite(favorite.dishId);
          },
        ));
      },
    );
  }
}
