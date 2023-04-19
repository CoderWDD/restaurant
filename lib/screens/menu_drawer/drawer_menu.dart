import 'package:flutter/material.dart';
import 'package:restaurant/constants/assets_constants.dart';
import 'package:restaurant/utils/px2dp.dart';

class DrawerMenu extends StatefulWidget {
  final String? name;
  final String? email;
  final String? avatarUrl;

  const DrawerMenu({Key? key, this.name, this.email, this.avatarUrl})
      : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.orange,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32.0.px3pt),
          bottomRight: Radius.circular(32.0.px3pt),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            curve: Curves.elasticInOut,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: Image.asset(drawerHeaderIllustration).image,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0.px3pt),
                topRight: Radius.circular(32.0.px3pt),
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(
                  left: 16.0.px3pt,
                  right: 16.0.px3pt,
                  top: 16.0.px3pt,
                  bottom: 16.0.px3pt,
                ),
                height: 181.px3pt,
                width: 327.px3pt,
                color: Colors.transparent,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 48.0.px3pt,
                      backgroundImage: widget.avatarUrl == null
                          ? null
                          : Image.network(
                              widget.avatarUrl!,
                              fit: BoxFit.scaleDown,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ).image,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(width: 16.0.px3pt),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0.px3pt),
                        Text(
                          widget.name ?? 'Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.px3pt,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.0.px3pt),
                        Text(
                          widget.email ?? 'email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.px3pt,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.favorite_border),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    'My favourites',
                    style: TextStyle(
                        fontSize: 16.px3pt,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'PoppinsNormal',
                        color: const Color(0xFF1C2D57)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.explore_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 16.px3pt,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'PoppinsNormal',
                        color: const Color(0xFF1C2D57)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.event_available_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    'Event',
                    style: TextStyle(
                        fontSize: 16.px3pt,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'PoppinsNormal',
                        color: const Color(0xFF1C2D57)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    'Setting',
                    style: TextStyle(
                        fontSize: 16.px3pt,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'PoppinsNormal',
                        color: const Color(0xFF1C2D57)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: Text(
                    'About',
                    style: TextStyle(
                        fontSize: 16.px3pt,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'PoppinsNormal',
                        color: const Color(0xFF1C2D57)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
