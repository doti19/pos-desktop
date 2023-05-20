// routes for the app
// import 'package:app/src/screens/home/index.dart';
// import 'package:app/src/screens/onboarding/authentication_screen.dart';
// import 'package:app/src/splash_screen.dart';
import 'package:flutter/material.dart';

import '../pages/menu_page.dart';
import '../screens/history_screen/history_screen.dart';
import '../screens/menu_page/home/home_screen.dart';
import '../screens/menu_page/products/products_screen.dart';
import '../splash_screen.dart';
import '../pages/index.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      // return MaterialPageRoute(builder: (_) => SplashScreen());
      return MaterialPageRoute(builder: (_) => Index());

    case '/home':
      return MaterialPageRoute(builder: (_) => Index());
    case '/menu':
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case '/history':
      return MaterialPageRoute(builder: (_) => HistoryScreen());
    case '/products':
      return MaterialPageRoute(builder: (_) => ProductsScreen());

    // return MaterialPageRoute(builder: (_) => MenuPage());
    case '/auth':
    // return MaterialPageRoute(builder: (_) => AuthenticationScreen());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
