import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/screens/home/home_tab.dart';
import 'package:restaurant/screens/home/like_tab.dart';
import 'package:restaurant/screens/home/orders_tab.dart';
import 'package:restaurant/screens/home/person_tab.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../components/card_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../constants/assets_constants.dart';
import '../menu_drawer/drawer_menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    LikeTab(),
    OrdersScreen(),
    PersonTab()
  ];

  final List<String> _title = [
    'Home',
    'Like',
    'Orders',
    'Me'
  ];

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
    return Scaffold(
      drawer: const DrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xFFF69B14),
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
            label: 'Like',
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
          style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              fontSize: 16.px3pt,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _children[_selectedIndex],
    );
  }
}