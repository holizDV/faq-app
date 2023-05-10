import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/faq_detail_entity.dart';
import '../repository/faq_repository.dart';

class GetDetailFaq implements UseCase<FaqDetailEntity, GetDetailFaqParams> {
  final FaqRepository repository;

  GetDetailFaq(this.repository);

  @override
  Future<Either<Failure, FaqDetailEntity>?> execute(
      GetDetailFaqParams params) async {
    return await repository.getDetail(params.faqID);
  }
}

class GetDetailFaqParams extends Equatable {
  final int faqID;

  const GetDetailFaqParams(this.faqID);

  @override
  List<Object> get props => [faqID];
}
