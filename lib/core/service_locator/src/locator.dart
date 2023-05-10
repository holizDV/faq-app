part of service_locator;

//* Service Locator
final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  /*
   * Service Locator By Features
   */
  authLocator(sl);
  faqLocator(sl);

  //! Core
  sl.registerLazySingleton<ApiMethod>(() => ApiMethodImpl(sl()));
  sl.registerLazySingleton(() => LocalStorage(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
}
