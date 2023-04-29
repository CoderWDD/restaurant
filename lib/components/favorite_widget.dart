
import 'package:flutter/material.dart';
import 'package:restaurant/entities/favorite.dart';
import 'package:restaurant/utils/px2dp.dart';

class FavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final Function(Favorite) onFavoriteIconClick;
  const FavoriteCard({Key? key, required this.favorite, required this.onFavoriteIconClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px3pt, vertical: 8.px3pt),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.px3pt),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
              blurRadius: 8.px3pt,
              offset: Offset(0, 2.px3pt),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              favorite.dish.image,
            ),
            radius: 25.px3pt,
          ),
          title: Text(
            favorite.dish.name,
            style: TextStyle(
              fontSize: 16.px3pt,
              fontFamily: 'RobotoMedium',
            ),
          ),
          subtitle: Text(
            favorite.dish.description,
            style: TextStyle(
              fontSize: 14.px3pt,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontFamily: 'RobotoRegular',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {
              onFavoriteIconClick(favorite);
            },
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ),
      ),
    );
  }
}
