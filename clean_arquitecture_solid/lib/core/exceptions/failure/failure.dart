import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errMessage;

  const Failure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required super.errMessage});
}

//* Para los posts

class BadRequestFailure extends Failure {
  const BadRequestFailure({required super.errMessage});
}

//* Los gets

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.errMessage});
}

//* Time out

class ConnectionTimeOutFailure extends Failure {
  const ConnectionTimeOutFailure({required super.errMessage});
}
