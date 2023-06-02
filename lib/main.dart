import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/viewmodel/all_cart_List_provider.dart';
import 'package:restaurant/viewmodel/auth_view_model.dart';
import 'package:restaurant/viewmodel/food_details_provider.dart';
import 'package:restaurant/viewmodel/home_dish_list_view_model.dart';
import 'package:restaurant/viewmodel/home_favorite_list_provider.dart';
import 'package:restaurant/viewmodel/home_restaurant_list_provider.dart';
import 'package:restaurant/viewmodel/paid_order_list_provider.dart';
import 'package:restaurant/viewmodel/un_paid_order_list_provider.dart';
import 'package:restaurant/viewmodel/order_view_model.dart';
import 'package:restaurant/viewmodel/restaurant_provider.dart';
import 'package:restaurant/viewmodel/served_cart_list_provider.dart';
import 'package:restaurant/viewmodel/unserved_cart_list_provider.dart';
import 'package:restaurant/viewmodel/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'md3/color_schemes.g.dart';

import 'routers.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runZonedGuarded(
    () {
      runApp(
        MultiProvider(
          providers: [
            // user view model
            ChangeNotifierProvider(create: (_) => UserViewModel()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => OrderViewModel()),
            ChangeNotifierProvider(create: (_) => HomeDishListProvider()),
            ChangeNotifierProvider(create: (_) => HomeRestaurantListProvider()),
            ChangeNotifierProvider(create: (_) => HomeFavoriteProvider()),
            ChangeNotifierProvider(create: (_) => FoodDetailsProvider()),
            ChangeNotifierProvider(create: (_) => AllCartListProvider()),
            ChangeNotifierProvider(create: (_) => ServeCartListProvider()),
            ChangeNotifierProvider(create: (_) => UnServeCartListProvider()),
            ChangeNotifierProvider(create: (_) => RestaurantProvider()),
            ChangeNotifierProvider(create: (_) => UnPaidOrderListProvider()),
            ChangeNotifierProvider(create: (_) => PaidOrderListProvider()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (Object obj, StackTrace stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: routers,
    );
  }
}
