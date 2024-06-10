import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/module/login/model/login_model.dart';
import 'package:flutter_architecture/module/login/repository/login_repository.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:flutter_architecture/utils/dialogue_utils/utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final _loginRepo = LoginRepository();
  
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;



  void loginMethod(){
    Utils.showLoading();
    Map<String, dynamic> data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    _loginRepo.loginApi(data).then((value){
      if( value['error'] == 'user not found'){
        Utils.snackBar('Login', '${value['error']}');
      }else{
        _loginRepo.saveUser(LoginResponseModel.fromJson(value)).then((value){
          Get.toNamed(RoutesName.homeScreen);
        });
        Utils.snackBar('Login', 'Login successfully');
      }

    }).onError((error, stackTrace){
      Utils.snackBar('Error', error.toString());
    });

    Utils.closeLoading();
  }

}