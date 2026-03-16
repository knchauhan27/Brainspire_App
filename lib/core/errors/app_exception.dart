abstract class AppException implements Exception {
  final String message;
  
  AppException({required this.message});
  
  @override
  String toString() => message;
}

class AuthException extends AppException {
  AuthException({required super.message});
}

class SuspendedUserException extends AppException {
  SuspendedUserException({required super.message});
}

class NetworkException extends AppException {
  NetworkException({required super.message});
}

class DataException extends AppException {
  DataException({required super.message});
}

class CommentTooLongException extends AppException {
  CommentTooLongException()
      : super(message: 'Comment exceeds maximum length of 500 characters');
}

class ParseException extends AppException {
  ParseException({required super.message});
}

class StorageException extends AppException {
  StorageException({required super.message});
}

class PDFGenerationException extends AppException {
  PDFGenerationException({required super.message});
}

class UnknownException extends AppException {
  UnknownException({required super.message});
}
