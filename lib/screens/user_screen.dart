import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
