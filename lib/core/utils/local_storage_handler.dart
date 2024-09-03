import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHandler {
  
  static Future<Map<String, dynamic>> getUserInfoLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String userInfo = prefs.getString('userInfo') ?? '';
      return jsonDecode(userInfo);
    } catch (_) {
      return {};
    }
  }

  static Future<void> saveUserInfoLocalStorage({
    required String name,
    required String lastNames,
    required String phone,
    required String email,
    required String birthdate,
    required String gender,
    required bool flagFillForm    
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> userInfo = {
        'name': name,
        'lastNames': lastNames,
        'phone': phone,
        'email': email,
        'birthdate': birthdate,
        'gender': gender,
        'flagFillForm': flagFillForm
      };
      prefs.setString('userInfo', jsonEncode(userInfo));
    } catch (_) {
    }
  }

}