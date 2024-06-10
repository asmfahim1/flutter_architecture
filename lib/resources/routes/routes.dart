import 'package:flutter_architecture/module/home/view/home_screen.dart';
import 'package:flutter_architecture/module/login/view/login_screen.dart';
import 'package:flutter_architecture/module/splash/view/splash_screen.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:flutter_architecture/utils/bindings/home_bindings.dart';
import 'package:flutter_architecture/utils/bindings/login_bindings.dart';
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
          binding: LoginBindings(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => HomeScreen(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.fade,
          binding: HomeBindings(),
        ),
      ];
}
