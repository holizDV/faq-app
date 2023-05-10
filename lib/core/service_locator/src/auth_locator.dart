import 'package:get_it/get_it.dart';

import '../../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../../features/auth/data/repository/auth_repository_impl.dart';
import '../../../features/auth/domain/repository/auth_repository.dart';
import '../../../features/auth/domain/usecase/login_user.dart';
import '../../../features/auth/presentation/bloc/login/login_bloc.dart';

Future<void> authLocator(GetIt sl) async {
  //? Presentation
  sl.registerFactory(() => LoginBloc(sl()));

  //? Use Case
  sl.registerLazySingleton(() => LoginUser(sl()));

  //? Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), localStorage: sl()));

  //? Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
}
