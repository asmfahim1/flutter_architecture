
abstract class BaseApiServices {


  //get api
  Future<dynamic> getApi(String url);


  //post api
  Future<dynamic> postApi(dynamic data, String url);
}