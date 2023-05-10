part of routes;

abstract class AppRoute {
  static GoRouter get router => _router;

  static const String loginPath = '/login';
  static const String homePath = '/home';

  static final GoRouter _router = GoRouter(
    initialLocation: loginPath,
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      //! auth route
      GoRoute(
        path: loginPath,
        pageBuilder: (context, state) => TransitionPage(
          state: state,
          child: BlocProvider(
            create: (_) => LoginBloc(sl()),
            child: LoginPage(),
          ),
        ),
      ),
      GoRoute(
        path: homePath,
        pageBuilder: (context, state) => TransitionPage(
          state: state,
          child: BlocProvider(
            create: (_) => FaqBloc(
              getListFaq: sl(),
              getDetailFaq: sl(),
              updateFaq: sl(),
              createFaq: sl(),
              deleteFaq: sl(),
            ),
            child: const HomeFaqPage(),
          ),
        ),
      ),
    ],
  );
}
