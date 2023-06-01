
import 'package:go_router/go_router.dart';
import 'package:restaurant/entities/QRResEntity.dart';
import 'package:restaurant/screens/canteen/canteen_screen.dart';
import 'package:restaurant/screens/canteen/restaurant_screen.dart';
import 'package:restaurant/screens/food_detail/food_details_screen.dart';
import 'package:restaurant/screens/login/login_screen.dart';
import 'package:restaurant/screens/qr_code_scan/qr_code_scan_screen.dart';
import 'package:restaurant/screens/register/register_screen.dart';
import 'package:restaurant/screens/splash/splash_screen.dart';

import 'constants/router_constants.dart';
import 'entities/canteen.dart';
import 'entities/dish.dart';
import 'go_router_data.dart';
import 'screens/home/home_screen.dart';

/// The route configuration.
final GoRouter routers = GoRouter(
  initialLocation: SPLASH_ROUTE,
  routes: <RouteBase>[
    GoRoute(
      path: HOME_ROUTE,
      builder: (context, state) => const MyHomePage(),
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: SPLASH_ROUTE,
      builder: (context, state) => SplashScreen(
        onLoginPressed: () {
          routers.go(LOGIN_ROUTE);
        },
        onRegisterPressed: () {
          routers.go(REGISTER_ROUTE);
        },
      ),
    ),
    GoRoute(
      path: REGISTER_ROUTE,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: LOGIN_ROUTE,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: FOOD_DETAILS_SCREEN,
      name: FOOD_DETAILS_SCREEN,
      builder: (context, state) {
        final data = state.extra as GoRouterData;
        return FoodDetailScreen(
          dish: Dish.fromJson(data.query),
        );
      },
    ),
    GoRoute(
      path: QR_Code_Scan_Screen,
      builder: (context, state) => const QRCodeScanScreen(),
    ),
    GoRoute(
      path: CANTEEN_SCREEN,
      name: CANTEEN_SCREEN,
      builder: (context, state) {
        final data = state.extra as QRResEntity;
        return CanteenDetailsScreen(qrResEntity: data);
      },
    ),
    GoRoute(
      path: RESTAURANT_SCREEN,
      name: RESTAURANT_SCREEN,
      builder: (context, state) {
        final data = state.extra as GoRouterData;
        return RestaurantScreen(canteen: Canteen.fromJson(data.query));
      }
    )
  ],
);
