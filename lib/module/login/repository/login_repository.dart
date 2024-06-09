import 'package:flutter_architecture/data/network/network_api_services.dart';
import 'package:flutter_architecture/resources/app_url/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();


  Future<dynamic> loginApi(var data) async{
    dynamic response = _apiServices.postApi(data, AppUrls.loginUrl);
    return response;
  }

}