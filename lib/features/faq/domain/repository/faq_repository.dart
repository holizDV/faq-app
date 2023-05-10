import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/faq_delete_entity.dart';
import '../entity/faq_detail_entity.dart';
import '../entity/faq_list_entity.dart';
import '../entity/faq_update_entity.dart';

abstract class FaqRepository {
  Future<Either<Failure, FaqListEntity>>? getList({
    required int page,
    required int rows,
  });

  Future<Either<Failure, FaqDetailEntity>>? getDetail(int faqID);
  Future<Either<Failure, FaqUpdateEntity>>? updateFaq({
    required String answer,
    required String question,
    required int faqID,
  });
  Future<Either<Failure, FaqUpdateEntity>>? createFaq({
    required String answer,
    required String question,
    required bool isPublish,
  });
  Future<Either<Failure, FaqDeleteEntity>>? deleteFaq(int faqID);
}
