import 'package:flutter_architecture/data/response/status.dart';
import 'package:flutter_architecture/module/home/model/user_list_model.dart';
import 'package:flutter_architecture/module/home/repository/home_repository.dart';
import 'package:flutter_architecture/module/login/repository/login_repository.dart';
import 'package:flutter_architecture/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  HomeRepository homeRepo = HomeRepository();

  void logout(){
    homeRepo.removeUser().then((value) {
      Get.offAll(RoutesName.loginScreen);
    });
  }

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListResponseModel().obs;
  final RxString error = ''.obs;


  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListResponseModel  _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;


  void getUserList(){
    homeRepo.getUserList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      
      setUserList(value);
      
    }).onError((error, stackTrace){
      print('Something went wrong');
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }


}