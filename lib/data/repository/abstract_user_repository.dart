import 'package:calaton_project_3/domain/abstract_user.dart';

abstract class IUserRepository {
  Future<void> signIn(String login, String password);

  Future<void> logOut();

  Future<IUser> get();
}
