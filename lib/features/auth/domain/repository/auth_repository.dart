import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>>? login({
    required String nip,
    required String password,
  });
}
