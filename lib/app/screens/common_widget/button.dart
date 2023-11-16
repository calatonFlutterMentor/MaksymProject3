// lib/app/screens/common_widgets/default_button.dart
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onPressedFunction,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Container(
        decoration: const ShapeDecoration(
          shape: StadiumBorder(side: BorderSide.none),
          color: Colors.transparent,
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: onPressedFunction,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
