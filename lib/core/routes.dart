import 'package:flutter/material.dart';
import 'package:weighty/ui/views/home_view/home_view.dart';
import 'package:weighty/ui/views/login_view/login_view.dart';
import 'package:weighty/ui/views/splash_view/splash_view.dart';

class Routes {
  static const splashRoute = '/';
  static const loginRoute = '/login';
  static const homeRoute = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}