import 'package:flutter/material.dart';
import 'package:instagram_clone/routes/routes.dart';

class NavigatorProvider extends ChangeNotifier {
  String _currentRoute = Routes.home;

  String get currentRoute => _currentRoute;

  set currentRoute(String value) {
    _currentRoute = value;
    notifyListeners();
  }
}
