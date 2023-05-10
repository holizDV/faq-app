import 'package:shared_preferences/shared_preferences.dart';

import '../manager/string_manager.dart';

class LocalStorage {
  SharedPreferences pref;

  LocalStorage(this.pref);

  void setTokenUser(String token) {
    pref.setString(AppStrings.prefTokenUser, token);
  }

  String? getTokenUser() {
    return pref.getString(AppStrings.prefTokenUser);
  }

  void removeTokenUser() {
    pref.remove(AppStrings.prefTokenUser);
  }
}
