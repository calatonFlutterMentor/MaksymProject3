// lib/data/repository/api_repository.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepository {
  final String apiKey;

  ApiRepository({required this.apiKey});

  Future<Map<String, dynamic>> fetchNews() async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=us'; // Отримання топових новин з США
    final response = await http.get(Uri.parse('$url&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {};
    }
  }
}
