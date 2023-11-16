// lib/app/screens/home/home_factory.dart
import 'package:calaton_project_3/app/screens/home/home_screen.dart';
import 'package:calaton_project_3/app/screens/home/home_view_model.dart';
import 'package:calaton_project_3/app/service/local_storage_service.dart';
import 'package:calaton_project_3/data/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenFactory {
  static Widget buildHomeScreen() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        apiRepository:
            ApiRepository(apiKey: 'e1582e1d03734458a8b7b2ca3e134c51'),
        localStorageService: LocalStorageService(),
      ),
      child: HomeScreen(),
    );
  }
}
