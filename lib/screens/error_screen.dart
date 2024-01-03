import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(
          'ERROR',
          style: TextStyle(color: red),
        ),
      ),
    );
  }
}
