import 'package:flutter_architecture/data/network/network_api_services.dart';
import 'package:flutter_architecture/module/login/model/login_model.dart';
import 'package:flutter_architecture/resources/app_url/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();


  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiServices.postApi(data, AppUrls.loginUrl);
    return response;
  }



  //saving user token and removing as well
  Future<bool> saveUser(LoginResponseModel loginResponseModel) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', loginResponseModel.token.toString());
    return true;
  }

  Future<LoginResponseModel> getUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return LoginResponseModel(
      token: token
    );
  }


  Future<bool> removeUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

}