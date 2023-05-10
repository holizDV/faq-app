import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);
  @override
  List<Object?> get props => [message];
}

class CacheException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class DataParsingException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class UnAuthorizedException extends Equatable implements Exception {
  final String message;

  const UnAuthorizedException(this.message);
  @override
  List<Object?> get props => [message];
}
