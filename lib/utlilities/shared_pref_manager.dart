import 'dart:convert';

import 'package:hosanna/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static String email = 'email';
  static String token = 'token';
  static String user = 'user';

  static Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future saveUser(User user) async {
    SharedPrefManager.setString(
      SharedPrefManager.user,
      jsonEncode(user),
    );
  }

  static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('user');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final User user = User.fromJson(userMap);
      print(user);
      return user;
    }
    return null;
  }

  static logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
