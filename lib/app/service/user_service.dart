import 'package:calaton_project_3/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<void> put(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', user.login);
    await prefs.setString('password', user.password);
  }

  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
    await prefs.remove('password');
  }

  Future<User> get() async {
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getString('login') ?? '';
    final password = prefs.getString('password') ?? '';
    return User(login: login, password: password);
  }
}
