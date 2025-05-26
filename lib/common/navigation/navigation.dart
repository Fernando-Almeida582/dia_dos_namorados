import 'package:flutter/material.dart';

import '../../home/screens/home_screen.dart';
import '../../splash/screens/splash_screen.dart';

class Navigation {
  late Map<String, Widget Function(dynamic)> _routes;

  Navigation(context) {
    _routes = {SplashScreen.routeName: (context) => const SplashScreen(),
      HomeScreen.routeName: (context) => const HomeScreen()};


  }
  get routes => _routes;

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
