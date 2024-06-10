import 'package:flutter_architecture/module/login/repository/login_repository.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  LoginRepository loginRepo = LoginRepository();

  void logout(){
    loginRepo.removeUser().then((value) {
      Get.offAll(RoutesName.loginScreen);
    });
  }

}