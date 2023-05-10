part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginEntity login;
  final ErrorObject? error;
  final bool isFormValid;

  const LoginState({
    required this.status,
    required this.login,
    this.error,
    this.isFormValid = false,
  });

  factory LoginState.initial() {
    return LoginState(
      status: LoginStatus.initial,
      login: LoginEntity(),
    );
  }

  @override
  List<Object> get props => [status, login, isFormValid];

  LoginState copyWith({
    LoginStatus? status,
    ErrorObject? error,
    LoginEntity? login,
    bool? isFormValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
      login: login ?? this.login,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
