class LoginResponseModel {
  String? _token;

  LoginResponseModel({String? token}) {
    if (token != null) {
      _token = token;
    }
  }

  String? get token => _token;
  set token(String? token) => _token = token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = _token;
    return data;
  }
}