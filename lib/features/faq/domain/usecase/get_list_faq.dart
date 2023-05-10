import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/faq_list_entity.dart';
import '../repository/faq_repository.dart';

class GetListFaq implements UseCase<FaqListEntity, GetListFaqParams> {
  final FaqRepository repository;

  GetListFaq(this.repository);

  @override
  Future<Either<Failure, FaqListEntity>?> execute(
      GetListFaqParams params) async {
    return await repository.getList(
      page: params.page,
      rows: params.rows,
    );
  }
}

class GetListFaqParams extends Equatable {
  final int page;
  final int rows;

  const GetListFaqParams({
    required this.page,
    required this.rows,
  });

  @override
  List<Object> get props => [page, rows];
}
