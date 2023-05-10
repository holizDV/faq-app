import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/error/error_object.dart';
import '../../domain/entity/faq_delete_entity.dart';
import '../../domain/entity/faq_detail_entity.dart';
import '../../domain/entity/faq_list_entity.dart';
import '../../domain/entity/faq_update_entity.dart';
import '../../domain/usecase/create_faq.dart';
import '../../domain/usecase/delete_faq.dart';
import '../../domain/usecase/get_detail_faq.dart';
import '../../domain/usecase/get_list_faq.dart';
import '../../domain/usecase/update_faq.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final GetListFaq getListFaq;
  final GetDetailFaq getDetailFaq;
  final UpdateFaq updateFaq;
  final CreateFaq createFaq;
  final DeleteFaq deleteFaq;

  final formKey = GlobalKey<FormBuilderState>();

  final questionCtrl = TextEditingController();
  final answerCtrl = TextEditingController();

  FaqBloc({
    required this.getListFaq,
    required this.getDetailFaq,
    required this.updateFaq,
    required this.createFaq,
    required this.deleteFaq,
  }) : super(FaqState.initial()) {
    on<FetchFaqListEvent>(_fetchList);
    on<FetchFaqDetailEvent>(_fetchDetail);
    on<UpdateFaqEvent>(_updateFaq);
    on<CreateFaqEvent>(_createFaq);
    on<DeleteFaqEvent>(_deleteFaq);
  }

  @override
  Future<void> close() {
    questionCtrl.dispose();
    answerCtrl.dispose();
    return super.close();
  }

  Future<void> _fetchList(
    FetchFaqListEvent event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(status: FaqStatus.loading));

    final result = await getListFaq.execute(const GetListFaqParams(
      page: 1,
      rows: 30,
    ));

    result?.fold((failure) {
      emit(state.copyWith(
        status: FaqStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (faq) {
      emit(state.copyWith(status: FaqStatus.loaded, faq: faq));
    });
  }

  Future<void> _fetchDetail(
    FetchFaqDetailEvent event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(statusDetail: FaqDetailStatus.loading));

    final result = await getDetailFaq.execute(GetDetailFaqParams(event.faqID));

    result?.fold((failure) {
      emit(state.copyWith(
        statusDetail: FaqDetailStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (faq) {
      emit(
          state.copyWith(statusDetail: FaqDetailStatus.loaded, faqDetail: faq));

      answerCtrl.text = faq.data!.jawaban!;
      questionCtrl.text = faq.data!.pertanyaan!;
    });
  }

  Future<void> _updateFaq(
    UpdateFaqEvent event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(statusUpdate: FaqUpdateStatus.loading));

    final result = await updateFaq.execute(UpdateFaqParams(
      answer: answerCtrl.text,
      question: questionCtrl.text,
      faqID: event.faqID,
    ));

    result?.fold((failure) {
      emit(state.copyWith(
        statusUpdate: FaqUpdateStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (faq) {
      emit(
          state.copyWith(statusUpdate: FaqUpdateStatus.loaded, faqUpdate: faq));
    });
  }

  Future<void> _createFaq(
    CreateFaqEvent event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(statusCreate: FaqCreateStatus.loading));

    final result = await createFaq.execute(CreateFaqParams(
      answer: answerCtrl.text,
      question: questionCtrl.text,
      isPublish: true,
    ));

    result?.fold((failure) {
      emit(state.copyWith(
        statusCreate: FaqCreateStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (faq) {
      emit(
          state.copyWith(statusCreate: FaqCreateStatus.loaded, faqUpdate: faq));
    });
  }

  Future<void> _deleteFaq(
    DeleteFaqEvent event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(statusDelete: FaqDeleteStatus.loading));

    final result = await deleteFaq.execute(DeleteFaqParams(event.faqID));

    result?.fold((failure) {
      emit(state.copyWith(
        statusDelete: FaqDeleteStatus.error,
        error: ErrorObject.mapFailureToErrorObject(failure),
      ));
    }, (faq) {
      emit(
          state.copyWith(statusDelete: FaqDeleteStatus.loaded, faqDelete: faq));
    });
  }
}
