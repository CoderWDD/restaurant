import 'dart:async';

import 'package:flutter/material.dart';

import 'md3/color_schemes.g.dart';

import 'routers.dart';

void main() {
  runZonedGuarded(
    () {
      runApp(const MyApp());
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