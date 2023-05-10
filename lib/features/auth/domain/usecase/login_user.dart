import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/login_entity.dart';
import '../repository/auth_repository.dart';

class LoginUser implements UseCase<LoginEntity, Params> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, LoginEntity>?> execute(Params params) async {
    return await repository.login(
      nip: params.nip,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String nip;
  final String password;

  const Params({
    required this.nip,
    required this.password,
  });

  @override
  List<Object> get props => [nip, password];
}
