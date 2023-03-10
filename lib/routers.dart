
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/food_detail/food_details_screen.dart';
import 'package:restaurant/screens/login/login_screen.dart';
import 'package:restaurant/screens/register/register_screen.dart';
import 'package:restaurant/screens/splash/splash_screen.dart';

import 'screens/home/home_screen.dart';

/// The route configuration.
final GoRouter routers = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen( onLoginPressed: (){}, onRegisterPressed: (){},),
    ),
  ],
);