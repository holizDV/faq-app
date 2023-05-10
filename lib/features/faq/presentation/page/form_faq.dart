import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../core/manager/font_manager.dart';
import '../../../../core/manager/values_manager.dart';
import '../../../../widget/button_primary.dart';
import '../../../../widget/custom_snackbar.dart';
import '../bloc/faq_bloc.dart';

enum FormFaqType { detail, add }

class FormFaq extends StatefulWidget {
  const FormFaq({required this.formType, this.faqID, super.key});

  final FormFaqType formType;
  final int? faqID;

  @override
  State<FormFaq> createState() => _FormFaqState();
}

class _FormFaqState extends State<FormFaq> {
  @override
  void initState() {
    onInit();
    super.initState();
  }

  String get title {
    if (widget.formType == FormFaqType.detail) {
      return "Detail";
    }
    return "Create New FAQ";
  }

  String get textButton {
    if (widget.formType == FormFaqType.detail) {
      return "Update";
    }
    return "Add";
  }

  void onInit() {
    if (widget.formType == FormFaqType.detail) {
      return context.read<FaqBloc>().add(FetchFaqDetailEvent(widget.faqID!));
    }
  }

  Widget actionState(BuildContext context) {
    final bloc = BlocProvider.of<FaqBloc>(context);

    if (widget.formType == FormFaqType.detail) {
      return BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          if (state.statusDetail == FaqDetailStatus.error) {
            return Center(
              child: Text(
                "Something Error",
                style: Typograph.headline6,
              ),
            );
          }
          if (state.statusDetail == FaqDetailStatus.loaded) {
            return KeyboardDismissOnTap(
              dismissOnCapturedTaps: true,
              child: FormBuilder(
                key: bloc.formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: "question",
                      controller: bloc.questionCtrl,
                      decoration: const InputDecoration(
                        labelText: "Questions",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    FormBuilderTextField(
                      name: "answer",
                      controller: bloc.answerCtrl,
                      decoration: const InputDecoration(
                        labelText: "Answers",
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: AppSize.s28),
                    BlocConsumer<FaqBloc, FaqState>(
                      builder: (context, state) {
                        return ButtonPrimary(
                          text: textButton,
                          isLoading:
                              state.statusUpdate == FaqUpdateStatus.loading,
                          onPressed: () => context
                              .read<FaqBloc>()
                              .add(UpdateFaqEvent(widget.faqID!)),
                        );
                      },
                      listener: (context, state) {
                        if (state.statusUpdate == FaqUpdateStatus.error) {
                          CustomSnackbar.showError(
                              context, state.error!.message);
                          return;
                        }
                        if (state.statusUpdate == FaqUpdateStatus.loaded) {
                          Navigator.of(context).pop();
                          return;
                        }
                      },
                    ),
                    const SizedBox(height: AppSize.s8),
                    BlocConsumer<FaqBloc, FaqState>(
                      builder: (context, state) {
                        return ButtonPrimary(
                          text: "Delete",
                          isLoading:
                              state.statusDelete == FaqDeleteStatus.loading,
                          onPressed: () => context
                              .read<FaqBloc>()
                              .add(DeleteFaqEvent(widget.faqID!)),
                        );
                      },
                      listener: (context, state) {
                        if (state.statusDelete == FaqDeleteStatus.error) {
                          CustomSnackbar.showError(
                              context, state.error!.message);
                          return;
                        }
                        if (state.statusDelete == FaqDeleteStatus.loaded) {
                          Navigator.of(context).pop();
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      );
    } else {
      return KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: FormBuilder(
          key: bloc.formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "question",
                controller: bloc.questionCtrl,
                decoration: const InputDecoration(
                  labelText: "Questions",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppSize.s16),
              FormBuilderTextField(
                name: "answer",
                controller: bloc.answerCtrl,
                decoration: const InputDecoration(
                  labelText: "Answers",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppSize.s28),
              BlocConsumer<FaqBloc, FaqState>(
                builder: (context, state) {
                  return ButtonPrimary(
                    text: textButton,
                    isLoading: state.statusCreate == FaqCreateStatus.loading,
                    onPressed: () =>
                        context.read<FaqBloc>().add(CreateFaqEvent()),
                  );
                },
                listener: (context, state) {
                  if (state.statusCreate == FaqCreateStatus.error) {
                    CustomSnackbar.showError(context, state.error!.message);
                    return;
                  }
                  if (state.statusCreate == FaqCreateStatus.loaded) {
                    Navigator.of(context).pop();
                    return;
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Typograph.label18m,
      ),
      scrollable: true,
      content: actionState(context),
    );
  }
}
