import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/faq_delete_entity.dart';
import '../../domain/entity/faq_detail_entity.dart';
import '../../domain/entity/faq_list_entity.dart';
import '../../domain/entity/faq_update_entity.dart';
import '../../domain/repository/faq_repository.dart';
import '../datasource/faq_remote_datasource.dart';
import '../model/faq_delete_model.dart';
import '../model/faq_detail_model.dart';
import '../model/faq_list_model.dart';
import '../model/faq_update_model.dart';

typedef _FaqList = Future<FaqListModel> Function();
typedef _FaqDetail = Future<FaqDetailModel> Function();
typedef _FaqUpdate = Future<FaqUpdateModel> Function();
typedef _FaqDelete = Future<FaqDeleteModel> Function();

class FaqRepositoryImpl implements FaqRepository {
  final FaqRemoteDataSource remoteDataSource;

  FaqRepositoryImpl(this.remoteDataSource);

  Future<Either<Failure, FaqListModel>> _getList(_FaqList t) async {
    try {
      final remote = await t();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }

  Future<Either<Failure, FaqDetailModel>> _getDetail(_FaqDetail t) async {
    try {
      final remote = await t();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }

  Future<Either<Failure, FaqUpdateModel>> _updateFaq(_FaqUpdate t) async {
    try {
      final remote = await t();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }

  Future<Either<Failure, FaqUpdateModel>> _createFaq(_FaqUpdate t) async {
    try {
      final remote = await t();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }

  Future<Either<Failure, FaqDeleteModel>> _deleteFaq(_FaqDelete t) async {
    try {
      final remote = await t();
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, FaqListEntity>>? getList(
      {required int page, required int rows}) {
    return _getList(() => remoteDataSource.getListFaq(page: page, rows: rows));
  }

  @override
  Future<Either<Failure, FaqDetailEntity>>? getDetail(int faqID) {
    return _getDetail(() => remoteDataSource.getDetail(faqID));
  }

  @override
  Future<Either<Failure, FaqUpdateEntity>>? updateFaq(
      {required String answer, required String question, required int faqID}) {
    return _updateFaq(() => remoteDataSource.updateFaq(
        answer: answer, question: question, faqID: faqID));
  }

  @override
  Future<Either<Failure, FaqUpdateEntity>>? createFaq(
      {required String answer,
      required String question,
      required bool isPublish}) {
    return _createFaq(() => remoteDataSource.createFaq(
        answer: answer, question: question, isPublish: isPublish));
  }

  @override
  Future<Either<Failure, FaqDeleteEntity>>? deleteFaq(int faqID) {
    return _deleteFaq(() => remoteDataSource.deleteFaq(faqID));
  }
}
