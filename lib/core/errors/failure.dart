abstract class Failure {
  final String message;
  
  Failure({required this.message});
  
  @override
  String toString() => message;
}

class AuthFailure extends Failure {
  AuthFailure({required super.message});
}

class SuspendedFailure extends Failure {
  SuspendedFailure({required super.message});
}

class PremiumRequiredFailure extends Failure {
  PremiumRequiredFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class DataFailure extends Failure {
  DataFailure({required super.message});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.message});
}

class ValidationFailure extends Failure {
  ValidationFailure({required super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
}
