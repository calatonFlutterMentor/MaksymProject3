// lib/app/screens/login/login_screen.dart
import 'package:calaton_project_3/app/screens/login/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:calaton_project_3/app/screens/login/login_view_model.dart';
import 'package:calaton_project_3/app/screens/home/home_factory.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.viewModel}) : super(key: key);

  final LoginViewModel viewModel;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Register below with your details!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InputField(
                  controller: emailController,
                  hintText: "login",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InputField(
                  controller: passwordController,
                  hintText: "password",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  if (emailController.text.length > 3 &&
                      passwordController.text.length > 3) {
                    widget.viewModel.onLogInButtonPressed(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => HomeScreenFactory.buildHomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text("Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
