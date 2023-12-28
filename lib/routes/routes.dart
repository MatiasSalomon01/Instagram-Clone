import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/screens.dart';

class Routes {
  static const String home = '/home';
  static const String search = '/search';
  static const String action = '/action';
  static const String reels = '/reels';
  static const String user = '/user';

  static Map<String, Widget Function(BuildContext)> mapRoutes = {
    home: (context) => const HomeScreen(),
    search: (context) => const SearchScreen(),
    action: (context) => const ActionScreen(),
    reels: (context) => const ReelsScreen(),
    user: (context) => const UserScreen()
  };
}
