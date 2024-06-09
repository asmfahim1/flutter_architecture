

class AppExceptions implements Exception{
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }

}

class InternetExceptions extends AppExceptions{

  InternetExceptions([String? message]) : super(message, 'No internet');

}

class RequestTimeOut extends AppExceptions{

  RequestTimeOut([String? message]) : super(message, 'Request time out');

}

class ServerExceptions extends AppExceptions{

  ServerExceptions([String? message]) : super(message, 'Internal server error');

}

class InvalidURLException extends AppExceptions{

  InvalidURLException([String? message]) : super(message, 'Invalid url');

}

class FetchDataException extends AppExceptions{

  FetchDataException([String? message]) : super(message, '');

}


// can add any kind of exceptions with respect to your app requirements


