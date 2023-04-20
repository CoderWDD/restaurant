import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/viewmodel/auth_view_model.dart';
import 'package:restaurant/viewmodel/user_view_model.dart';

import 'md3/color_schemes.g.dart';

import 'routers.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(
        MultiProvider(
          providers: [
            // user view model
            ChangeNotifierProvider(create: (_) => UserViewModel()),
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
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
