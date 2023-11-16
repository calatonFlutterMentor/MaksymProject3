// lib/service/local_storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';

  Future<void> saveUserCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
  }

  Future<Map<String, String>> getUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emailKey) ?? '';
    final password = prefs.getString(_passwordKey) ?? '';
    return {'email': email, 'password': password};
  }
}
