// lib/data/model/user.dart
import 'package:calaton_project_3/domain/abstract_user.dart';

class User implements IUser {
  @override
  final String login;

  @override
  final String password;

  User({required this.login, required this.password});
}
