//* Clase abstracta genérica que nos servirá para decir el tipo de Excepción que tenemos.
abstract class RequestExceptionData {
  final int statusCode;
  final String errMessage;

  RequestExceptionData({required this.statusCode, required this.errMessage});
}

class BadRequestException extends RequestExceptionData implements Exception {
  BadRequestException({required super.statusCode, required super.errMessage});
}

class NotFoundExceptions extends RequestExceptionData implements Exception {
  NotFoundExceptions({required super.statusCode, required super.errMessage});
}

class ConnectionTimeOut extends RequestExceptionData implements Exception {
  ConnectionTimeOut({required super.statusCode, required super.errMessage});
}


class GenericException extends RequestExceptionData implements Exception {
  GenericException({required super.statusCode, required super.errMessage});
}


