import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/theme/custom_theme.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomAppBarProvider()),
        ChangeNotifierProvider(create: (context) => NavigatorProvider()),
        // ChangeNotifierProvider(create: (context) => ContentProvider()),
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
      home: const MainScreen(),
      theme: CustomTheme.lightMode,
      // initialRoute: Routes.home,
      // navigatorObservers: [NavigatorObserverService()],
      // onGenerateRoute: (settings) => Routes.onGenerateRoutes(settings),
    );
  }
}
