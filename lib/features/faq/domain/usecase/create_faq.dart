import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/faq_update_entity.dart';
import '../repository/faq_repository.dart';

class CreateFaq implements UseCase<FaqUpdateEntity, CreateFaqParams> {
  final FaqRepository repository;

  CreateFaq(this.repository);

  @override
  Future<Either<Failure, FaqUpdateEntity>?> execute(
      CreateFaqParams params) async {
    return await repository.createFaq(
      answer: params.answer,
      question: params.question,
      isPublish: params.isPublish,
    );
  }
}

class CreateFaqParams extends Equatable {
  final bool isPublish;
  final String answer;
  final String question;

  const CreateFaqParams(
      {required this.answer, required this.question, required this.isPublish});

  @override
  List<Object> get props => [isPublish, answer, question];
}
