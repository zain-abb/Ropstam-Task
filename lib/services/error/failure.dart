import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}

// Network Failure
class NetworkFailure extends Failure {
  const NetworkFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}

// No User Found  Failure
class NoUserFoundFailure extends Failure {
  const NoUserFoundFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}

// No User Found  Failure
class InvalidInputFailure extends Failure {
  const InvalidInputFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}

// No User Found  Failure
class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure(message) : super(message);
  @override
  List<Object> get props => [message];
}
