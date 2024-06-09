import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/module/login/repository/login_repository.dart';
import 'package:flutter_architecture/utils/utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final _loginRepo = LoginRepository();
  
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;



  void loginMethod(){
    Map<String, dynamic> data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _loginRepo.loginApi(data).then((value){
      Utils.snackBar('Login', 'Login successfully');
    }).onError((error, stackTrace){
      Utils.snackBar('Error', error.toString());
    });
  }

}