import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.serverFailure(String message) = ServerFailure;
  factory Failure.lostConnectionFailure() = LostConnectionFailure;
  factory Failure.unAuthorizeFailure(String message) = UnAuthorizeFailure;
}
