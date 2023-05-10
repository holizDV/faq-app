import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/faq_delete_entity.dart';
import '../repository/faq_repository.dart';

class DeleteFaq implements UseCase<FaqDeleteEntity, DeleteFaqParams> {
  final FaqRepository repository;

  DeleteFaq(this.repository);

  @override
  Future<Either<Failure, FaqDeleteEntity>?> execute(
      DeleteFaqParams params) async {
    return await repository.deleteFaq(params.faqID);
  }
}

class DeleteFaqParams extends Equatable {
  final int faqID;

  const DeleteFaqParams(this.faqID);

  @override
  List<Object> get props => [faqID];
}
