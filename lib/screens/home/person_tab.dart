import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../constants/router_constants.dart';
import '../../viewmodel/user_view_model.dart';

class PersonTab extends StatefulWidget {
  const PersonTab({Key? key}) : super(key: key);

  @override
  State<PersonTab> createState() => _PersonTabState();
}

class _PersonTabState extends State<PersonTab> {
  String defaultUrl = 'https://picsum.photos/id/237/200/300';
  String? urlImage;

  @override
  Widget build(BuildContext context) {
    // get the user view model from provider
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    String username = user.username;
    String email = user.email ?? "email";
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.onPrimary,
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2.0.px3pt,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                // TODO: Handle user container click
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        urlImage ?? defaultUrl,
                      ),
                      radius: 25.0,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.edit)
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.onPrimary,
            margin: const EdgeInsets.all(16.0),
            elevation: 2.0.px3pt,
            child: Column(
              children: [
                ListTile(
                  title: const Text('未支付订单'),
                  leading: const Icon(Icons.call_to_action_rounded),
                  onTap: () {
                    routers.push(UNPAID_ORDER_LIST_SCREEN);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.px3pt), topRight: Radius.circular(10.px3pt)),
                  ),
                ),
                ListTile(
                  title: const Text('已支付订单'),
                  leading: const Icon(Icons.notifications),
                  onTap: () {
                    routers.push(PAID_ORDER_LIST_SCREEN);
                  },
                ),
                ListTile(
                  title: const Text('帮助'),
                  leading: const Icon(Icons.help),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('退出登录'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.px3pt), bottomRight: Radius.circular(10.px3pt)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
