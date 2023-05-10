import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/local_storage.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/login_model.dart';

typedef _T = Future<LoginModel> Function();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorage localStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorage,
  });

  @override
  Future<Either<Failure, LoginEntity>>? login({
    required String nip,
    required String password,
  }) async {
    return _login(() => remoteDataSource.loginUser(
          nip: nip,
          password: password,
        ));
  }

  Future<Either<Failure, LoginEntity>> _login(_T t) async {
    try {
      final remote = await t();
      localStorage.setTokenUser(remote.data!.accessToken!);
      return Right(remote);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizedException catch (e) {
      return Left(UnAuthorizeFailure(e.message));
    }
  }
}
