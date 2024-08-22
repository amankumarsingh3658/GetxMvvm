class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super('', 'Request Time Out');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, '');
}
