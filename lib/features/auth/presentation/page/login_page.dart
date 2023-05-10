import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/manager/font_manager.dart';
import '../../../../core/manager/values_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../widget/button_primary.dart';
import '../../../../widget/custom_snackbar.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("FAQ App", style: Typograph.headline5),
                const SizedBox(height: AppSize.s28),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  margin: const EdgeInsets.symmetric(horizontal: AppMargin.m24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: FormBuilder(
                    key: bloc.formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: "nip",
                          controller: bloc.nipCtrl,
                          decoration: const InputDecoration(
                            labelText: "NIP",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(),
                          //   FormBuilderValidators.numeric(),
                          //   FormBuilderValidators.max(70),
                          // ]),
                        ),
                        const SizedBox(height: AppSize.s16),
                        FormBuilderTextField(
                          name: "password",
                          controller: bloc.passwordCtrl,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context),
                          //   FormBuilderValidators.email(context),
                          // ]),
                        ),
                        const SizedBox(height: AppSize.s24),
                        BlocConsumer<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return ButtonPrimary(
                              text: "Login",
                              isDisable: state.isFormValid,
                              isLoading: state.status == LoginStatus.loading,
                              onPressed: () => context
                                  .read<LoginBloc>()
                                  .add(UserLoginEvent()),
                            );
                          },
                          listener: (context, state) {
                            if (state.status == LoginStatus.error) {
                              CustomSnackbar.showError(
                                  context, state.error!.message);
                              return;
                            }
                            if (state.status == LoginStatus.loaded) {
                              context.pushReplacement(AppRoute.homePath);
                              return;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
