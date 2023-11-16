// lib/app/screens/login/login_view_model.dart
import 'package:calaton_project_3/app/common/base_change_notifier.dart';
import 'package:calaton_project_3/app/service/local_storage_service.dart';
import 'package:calaton_project_3/data/repository/abstract_user_repository.dart';

class LoginViewModel extends BaseChangeNotifier {
  final IUserRepository _userRepository;
  final LocalStorageService _localStorageService;

  LoginViewModel({
    required IUserRepository userRepository,
    required LocalStorageService localStorageService,
  })  : _userRepository = userRepository,
        _localStorageService = localStorageService;

  Future<void> onLogInButtonPressed(String email, String password) async {
    startLoading();
    await _userRepository.signIn(email, password);
    await _localStorageService.saveUserCredentials(email, password);
    stopLoading();
  }
}
