

class AppExceptions implements Exception {

  final _message ;
  final _prefix ;

  AppExceptions([this._message , this._prefix]) ;

  @override
  String toString(){
    return '$_prefix$_message';
  }

}


class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet') ;
}


class RequestTimeOut extends AppExceptions {

  RequestTimeOut([String? message]) : super(message, 'Request Time out') ;

}

class ServerException extends AppExceptions {

  ServerException([String? message]) : super(message, 'Internal server error') ;

}

class InvalidUrlException extends AppExceptions {

  InvalidUrlException([String? message]) : super(message, 'Invalid Url') ;

}

class FetchDataException extends AppExceptions {

  FetchDataException([String? message]) : super(message, '') ;

}