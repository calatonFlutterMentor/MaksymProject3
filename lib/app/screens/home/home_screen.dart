import 'package:calaton_project_3/app/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'You are already logged in',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final newsList = await viewModel.fetchNews();
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final newsItem = newsList[index];
                            return ListTile(
                              title: Text(newsItem['title'] ?? ''),
                              subtitle: Text(newsItem['description'] ?? ''),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text("Fetch News"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
