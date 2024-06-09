import 'package:flutter_architecture/module/login/view/login_screen.dart';
import 'package:flutter_architecture/module/splash/view/splash_screen.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(microseconds: 250),
            transition: Transition.fade,
        ),
        GetPage(
            name: RoutesName.loginScreen,
            page: () => LoginScreen(),
            transitionDuration: const Duration(microseconds: 250),
            transition: Transition.fade,
        ),
      ];
}
