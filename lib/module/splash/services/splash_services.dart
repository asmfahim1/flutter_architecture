import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/module/login/repository/login_repository.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  LoginRepository loginRepository = LoginRepository();



  void isLogin() {
    loginRepository.getUser().then((value) {
      if (kDebugMode) {
        print('value is $value');
      }

      // Check if value.token is null or empty
      if (value.token == null || value.token!.isEmpty) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.loginScreen);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.homeScreen);
        });
      }
    }).catchError((error) {
      // Handle any errors that occur during the getUser() call
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      Timer(const Duration(seconds: 3), () {
        Get.toNamed(RoutesName.loginScreen);
      });
    });
  }
}
