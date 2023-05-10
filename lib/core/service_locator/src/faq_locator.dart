import 'package:get_it/get_it.dart';

import '../../../features/faq/data/datasource/faq_remote_datasource.dart';
import '../../../features/faq/data/repository/faq_repository_impl.dart';
import '../../../features/faq/domain/repository/faq_repository.dart';
import '../../../features/faq/domain/usecase/create_faq.dart';
import '../../../features/faq/domain/usecase/delete_faq.dart';
import '../../../features/faq/domain/usecase/get_detail_faq.dart';
import '../../../features/faq/domain/usecase/get_list_faq.dart';
import '../../../features/faq/domain/usecase/update_faq.dart';
import '../../../features/faq/presentation/bloc/faq_bloc.dart';

Future<void> faqLocator(GetIt sl) async {
  //? Presentation
  sl.registerFactory(() => FaqBloc(
        getListFaq: sl(),
        getDetailFaq: sl(),
        updateFaq: sl(),
        createFaq: sl(),
        deleteFaq: sl(),
      ));

  //? Use Case
  sl.registerLazySingleton(() => GetListFaq(sl()));
  sl.registerLazySingleton(() => GetDetailFaq(sl()));
  sl.registerLazySingleton(() => UpdateFaq(sl()));
  sl.registerLazySingleton(() => CreateFaq(sl()));
  sl.registerLazySingleton(() => DeleteFaq(sl()));

  //? Repository
  sl.registerLazySingleton<FaqRepository>(() => FaqRepositoryImpl(sl()));

  //? Data Source
  sl.registerLazySingleton<FaqRemoteDataSource>(
      () => FaqRemoteDataSourceImpl(localStorage: sl(), method: sl()));
}
