import 'package:equatable/equatable.dart';

import 'failures.dart';

class ErrorObject extends Equatable {
  final String title;
  final String message;

  const ErrorObject({
    required this.title,
    required this.message,
  });

  @override
  List<Object> get props => [title, message];

  static ErrorObject mapFailureToErrorObject(Failure failure) {
    return failure.when(
      serverFailure: (err) {
        return ErrorObject(
          title: 'Server',
          message: err,
        );
      },
      lostConnectionFailure: () {
        return const ErrorObject(
          title: 'Connection',
          message: 'Connection failed',
        );
      },
      unAuthorizeFailure: (err) {
        return ErrorObject(
          title: 'UnAuthorize',
          message: err,
        );
      },
    );
  }
}
