import 'package:flutter/material.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/theme/custom_theme.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: Routes.mapRoutes,
      theme: CustomTheme.lightMode,
    );
  }
}
