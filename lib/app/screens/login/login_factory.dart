// lib/app/screens/login/login_factory.dart
import 'package:calaton_project_3/app/screens/login/login_screen.dart';
import 'package:calaton_project_3/app/screens/login/login_view_model.dart';
import 'package:calaton_project_3/app/service/local_storage_service.dart';
import 'package:calaton_project_3/app/service/user_service.dart';
import 'package:calaton_project_3/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFactory {
  static Widget build() {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(
        userRepository: UserRepository(prefService: UserService()),
        localStorageService: LocalStorageService(),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => LoginScreen(viewModel: model),
      ),
    );
  }
}
