import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/error/error_object.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/usecase/login_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormBuilderState>();

  final LoginUser loginUser;

  final nipCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  LoginBloc(this.loginUser) : super(LoginState.initial()) {
    on<UserLoginEvent>(_userLogin);
  }

  @override
  Future<void> close() {
    nipCtrl.dispose();
    passwordCtrl.dispose();
    return super.close();
  }

  Future<void> _userLogin(
    UserLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await loginUser.execute(Params(
      nip: nipCtrl.text,
      password: passwordCtrl.text,
      // nip: "applicantimp@gmail.com",
      // password: "00000000",
    ));

    result?.fold((failure) {
      emit(state.copyWith(
        status: LoginStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (login) {
      emit(state.copyWith(status: LoginStatus.loaded, login: login));
    });
  }
}
