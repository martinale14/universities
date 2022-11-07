import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universities/src/splash/ui/screens/splash_screen.dart';

class CoreNavigator extends NavigationService {
  pushReplacement(String route, {dynamic arguments}) =>
      pushNamedAndRemoveUntil(route, arguments: arguments);

  Future<dynamic> push(String route, {dynamic arguments}) async =>
      await navigateTo(
        route,
        arguments: arguments,
      );
}

extension Pages on String {
  static const splash = '/';
}

Map<String, WidgetBuilder> routesApp = {
  Pages.splash: (context) => const SplashScreen(),
};

Widget pageTransition(context, animation, secondaryAnimation, child) {
  const begin = 0.0;
  const end = 1.0;
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);

  return FadeTransition(
    opacity: offsetAnimation,
    child: child,
  );
}
