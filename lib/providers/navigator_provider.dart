import 'package:flutter/material.dart';
import 'package:instagram_clone/routes/routes.dart';

class NavigatorProvider extends ChangeNotifier {
  String _routeName = Routes.home;

  String get routeName => _routeName;

  set routeName(String value) {
    _routeName = value;
    Future.microtask(() {
      notifyListeners();
    });
  }

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
