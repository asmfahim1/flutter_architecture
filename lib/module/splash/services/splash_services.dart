import 'dart:async';

import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(
      const Duration(seconds: 1),
      () {
        Get.toNamed(RoutesName.loginScreen);
      },
    );
  }
}
