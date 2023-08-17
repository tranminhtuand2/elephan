import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<void> setAccessToken(String accessToken) async {
    await _preferences!.setString('access_token', accessToken);
  }

  String getAccessToken() {
    return _preferences!.getString('access_token') ?? '';
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await _preferences!.setString('refresh_token', refreshToken);
  }

  String getRefreshToken() {
    return _preferences!.getString('refresh_token') ?? '';
  }

  Future<void> setUser(Map<String, dynamic> userInfo) async {
    await _preferences!.setString('user_info', json.encode(userInfo));
  }

  Map<String, dynamic> getUser() {
    final userInfoString = _preferences!.getString('user_info');
    if (userInfoString != null && userInfoString.isNotEmpty) {
      return json.decode(userInfoString);
    } else {
      return {};
    }
  }
}
