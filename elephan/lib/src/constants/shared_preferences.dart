import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_result.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<void> setLoginResult(LoginResult loginResult) async {
    await _preferences!
        .setString('LOGIN_RESULT', json.encode(loginResult.toJson()));
  }

  Future<LoginResult?> getLoginResult() async {
    try {
      String json = _preferences!.getString('LOGIN_RESULT') ?? "";
      LoginResult loginResult = LoginResult.fromJson(jsonDecode(json));
      return loginResult;
    } catch (e) {
      return null;
    }
  }

  Future<void> setIsFirstInstall(bool firstInstall) async {
    await _preferences!.setBool('check_first_install', firstInstall);
  }

  Future<void> setInforLogin(List<String> infor) async {
    await _preferences!.setStringList('inforLogin', infor);
  }

  Future<List<String>> getInforLogin() async {
    return _preferences!.getStringList('inforLogin') ?? [];
  }

  bool getIsFirstInstall() {
    return _preferences!.getBool('check_first_install') ?? true;
  }
}
