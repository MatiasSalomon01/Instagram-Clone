import 'package:flutter/material.dart';
import 'package:instagram_clone/helpers/helpers.dart';
import 'package:instagram_clone/screens/screens.dart';

class Routes {
  static const String home = '/home';
  static const String search = '/search';
  static const String create = '/create';
  static const String reels = '/reels';
  static const String user = '/user';
  static const String error = '/error';

  static Map<String, Widget Function(BuildContext)> mapRoutes = {
    home: (context) => const HomeScreen(),
    search: (context) => const SearchScreen(),
    create: (context) => const CreateScreen(),
    reels: (context) => const ReelsScreen(),
    user: (context) => const UserScreen(),
    error: (context) => const ErrorScreen()
  };

  static Map<String, Widget> map = {
    home: const HomeScreen(),
    search: const SearchScreen(),
    create: const CreateScreen(),
    reels: const ReelsScreen(),
    user: const UserScreen(),
    error: const ErrorScreen()
  };

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return navigateTo(Routes.home);
      case Routes.search:
        return navigateTo(Routes.search);
      case Routes.create:
        return navigateTo(Routes.create);
      case Routes.reels:
        return navigateTo(Routes.reels);
      case Routes.user:
        return navigateTo(Routes.user);
    }
    return navigateTo(Routes.error);
  }
}
