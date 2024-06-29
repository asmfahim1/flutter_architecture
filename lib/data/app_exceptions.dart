class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request time out');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, 'Internal server error');
}

class InvalidURLException extends AppExceptions {
  InvalidURLException([String? message]) : super(message, 'Invalid url');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}

class FormatException extends AppExceptions {
  FormatException([String? message])
      : super(message, 'Format exception occurred');
}

class HttpException extends AppExceptions {
  HttpException([String? message]) : super(message, 'HTTP exception occurred');
}

class NoSuchMethodError extends AppExceptions {
  NoSuchMethodError([String? message]) : super(message, 'Missing fromJson ');
}

// can add any kind of exceptions with respect to your app requirements
