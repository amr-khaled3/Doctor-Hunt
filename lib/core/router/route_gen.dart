import 'package:doctor_hunt/core/router/app_route_name.dart';
import 'package:doctor_hunt/features/presentation/screens/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/screens/splash/splash_screen.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class RouteGen {
  static Route<dynamic> onChaneRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) {
            return SplashScreen();
          },
        );
      case RouteName.onboarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Onboarding();
          },
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return NotFound();
          },
        );
    }
  }
}
