import 'package:shared_preferences/shared_preferences.dart';

class AuthCacheManager {
  static Future<void> saveUserToken({required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

  static Future<String?> fetchUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  static Future<void> deleteUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userToken');
  }
}
