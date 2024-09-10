import 'package:flutter/material.dart';
import 'package:product_app/model/prodct.dart';
import 'package:product_app/view/auth/sign_up_screen.dart';
import 'package:product_app/view/favorite_screen.dart';
import 'package:product_app/view/home.dart';

import 'package:product_app/view/not_found_page.dart';
import 'package:product_app/view/order_view.dart';
import 'package:product_app/view/product_cart.dart';
import 'package:product_app/view/product_datelis.dart';
import 'package:product_app/view/product_view.dart';
import 'package:product_app/view/splash_view.dart';
import 'package:product_app/view/statefull_screen.dart';

class AppRoute {
  static Route<dynamic>? routeManager(RouteSettings settings) {
    switch (settings.name) {
      case '/fav':
        return MaterialPageRoute(
          builder: (context) => FavoriteScreen(
       
          ),
        );
      case '/signup':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
        case '/order':
        return MaterialPageRoute(builder: (context) => const OrderView());
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case '/productView':
        return MaterialPageRoute(
          builder: (context) => const ProductView(),
        );
      case '/demo':
        return MaterialPageRoute(
          builder: (context) => const StatefullScreen(),
        );
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case '/productDetalis':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ProductDatelis(),
        );
      case '/productCart':
        return MaterialPageRoute(
          builder: (context) => const ProductCart(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
    
  }
}
