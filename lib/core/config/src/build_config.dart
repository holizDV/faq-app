part of config;

enum DebugMode { debugOnly, debugLayout }

class BuildConfig {
  final String baseUrlFAQ;

  final DebugMode debugMode;

  BuildConfig._({
    required this.baseUrlFAQ,
    required this.debugMode,
  });

  BuildConfig._stg({required DebugMode debugMode})
      : this._(
          baseUrlFAQ: dotenv.env["BASE_URL_STG"] ?? "",
          debugMode: debugMode,
        );

  static late BuildConfig _instance;

  static void init() {
    const strDebugMode = String.fromEnvironment("DEBUG_MODE");
    const debugMode = strDebugMode == "DEBUG_LAYOUT"
        ? DebugMode.debugLayout
        : DebugMode.debugOnly;

    _instance = BuildConfig._stg(debugMode: debugMode);
  }

  static BuildConfig get() {
    return _instance;
  }

  static bool isDebugLayout() => _instance.debugMode == DebugMode.debugLayout;

  static bool isDebugOnly() => _instance.debugMode == DebugMode.debugOnly;
}
