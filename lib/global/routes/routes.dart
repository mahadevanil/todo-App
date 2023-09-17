import 'package:flutter/material.dart';

import '../../views/home/view/home_screen.dart';
import '../splash/view/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //*---------------------------------(Splash_route)
  '/': (BuildContext context) => const SplashScreen(),

  //*-----------------------------------(home_screen)
  '/home': (BuildContext context) => const HomeScreen(),
};
