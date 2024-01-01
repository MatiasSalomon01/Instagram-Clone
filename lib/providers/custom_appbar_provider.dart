import 'package:flutter/material.dart';

class CustomAppBarProvider extends ChangeNotifier {
  bool _isAtEdge = true;

  bool get isAtEdge => _isAtEdge;

  set isAtEdge(bool value) {
    _isAtEdge = value;
    notifyListeners();
  }
}
