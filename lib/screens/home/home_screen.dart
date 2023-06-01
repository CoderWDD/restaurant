
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/routers.dart';
import 'package:restaurant/screens/home/home_tab.dart';
import 'package:restaurant/screens/home/like_tab.dart';
import 'package:restaurant/screens/home/orders_tab.dart';
import 'package:restaurant/screens/home/person_tab.dart';
import 'package:restaurant/utils/px2dp.dart';
import 'package:restaurant/viewmodel/user_view_model.dart';
import '../../constants/assets_constants.dart';
import '../../constants/router_constants.dart';
import '../menu_drawer/drawer_menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const HomeTab(),
    const LikeTab(),
    const OrdersTab(),
    const PersonTab()
  ];

  final List<String> _title = ['Home', 'My Favorites', 'Orders', 'Me'];

  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // get the user view model from provider
    var user = Provider.of<UserViewModel>(context, listen: false).user;
    return Scaffold(
      drawer: DrawerMenu(name: user.username, email: user.email),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).colorScheme.primary,
        elevation: 12.px3pt,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeIllustration,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              likeIllustration,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ordersIllustration,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              personIllustration,
            ),
            label: 'Me',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title[_selectedIndex],
          style: const TextStyle(
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              routers.push(QR_Code_Scan_Screen);
            },
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: _children[_selectedIndex],
    );
  }
}
