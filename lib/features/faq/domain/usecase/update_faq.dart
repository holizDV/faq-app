import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/faq_update_entity.dart';
import '../repository/faq_repository.dart';

class UpdateFaq implements UseCase<FaqUpdateEntity, UpdateFaqParams> {
  final FaqRepository repository;

  UpdateFaq(this.repository);

  @override
  Future<Either<Failure, FaqUpdateEntity>?> execute(
      UpdateFaqParams params) async {
    return await repository.updateFaq(
      answer: params.answer,
      question: params.question,
      faqID: params.faqID,
    );
  }
}

class UpdateFaqParams extends Equatable {
  final int faqID;
  final String answer;
  final String question;

  const UpdateFaqParams(
      {required this.answer, required this.question, required this.faqID});

  @override
  List<Object> get props => [faqID, answer, question];
}
