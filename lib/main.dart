import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:instagram_clone/services/services.dart';
import 'package:instagram_clone/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomAppBarProvider()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: Routes.mapRoutes,
      theme: CustomTheme.lightMode,
      navigatorObservers: [NavigatorObserverService()],
    );
  }
}
