// lib/app/screens/home/home_view_model.dart
import 'package:calaton_project_3/app/common/base_change_notifier.dart';
import 'package:calaton_project_3/app/service/local_storage_service.dart';
import 'package:calaton_project_3/data/repository/api_repository.dart';

class HomeViewModel extends BaseChangeNotifier {
  final ApiRepository apiRepository;
  final LocalStorageService localStorageService;

  HomeViewModel({
    required this.apiRepository,
    required this.localStorageService,
  });

  Future<List<Map<String, dynamic>>> fetchNews() async {
    startLoading();

    try {
      final newsData = await apiRepository.fetchNews();
      // Обробка отриманих даних новин
      final List<Map<String, dynamic>> newsList =
          List<Map<String, dynamic>>.from(newsData['articles']);
      print('Received news data: $newsList');
      return newsList;
    } catch (e) {
      // Обробка помилок
      print('Error fetching news data: $e');
      return [];
    } finally {
      stopLoading();
    }
  }
}
