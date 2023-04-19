

import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';

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
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
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
                        'https://picsum.photos/id/${index + 1}/100/100',
                      ),
                      radius: 25.px3pt,
                    ),
                    title: Text(
                      'Recipe Name',
                      style: TextStyle(
                        fontSize: 16.px3pt,
                        fontFamily: 'RobotoMedium',
                      ),
                    ),
                    subtitle: Text(
                      'Description of recipe',
                      style: TextStyle(
                        fontSize: 14.px3pt,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontFamily: 'RobotoRegular',
                      ),
                    ),
                    trailing: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}