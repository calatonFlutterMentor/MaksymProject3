// lib/data/repository/user_repo.dart
import 'package:calaton_project_3/app/service/user_service.dart';
import 'package:calaton_project_3/data/model/user_model.dart';
import 'package:calaton_project_3/data/repository/abstract_user_repository.dart';
import 'package:calaton_project_3/domain/abstract_user.dart';

class UserRepository implements IUserRepository {
  UserRepository({required UserService prefService})
      : _prefService = prefService;
  final UserService _prefService;

  @override
  Future<void> signIn(String login, String password) {
    return _prefService.put(User(login: login, password: password));
  }

  @override
  Future<void> logOut() {
    return _prefService.remove();
  }

  @override
  Future<IUser> get() {
    return _prefService.get();
  }
}
