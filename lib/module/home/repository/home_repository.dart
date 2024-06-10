

import 'package:flutter_architecture/data/network/network_api_services.dart';
import 'package:flutter_architecture/module/home/model/user_list_model.dart';
import 'package:flutter_architecture/resources/app_url/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository{
  final _apiServices = NetworkApiServices();


  Future<UserListResponseModel> getUserList() async{
    dynamic response = await _apiServices.getApi(AppUrls.userList);
    return UserListResponseModel.fromJson(response);
  }


  //can write rest of the api calls here. Not only that we can clear data using shared prefs

  Future<bool> removeUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}