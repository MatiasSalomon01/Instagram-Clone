import 'package:flutter/material.dart';

class CustomAppBarProvider extends ChangeNotifier {
  late final ScrollController mainController;

  CustomAppBarProvider() {
    mainController = ScrollController();
    mainController.addListener(isAtEdge);
  }

  isAtEdge() {
    if (!mainController.position.atEdge &&
        showDivider &&
        mainController.offset > 0) {
      showDivider = false;
    }

    if (mainController.position.outOfRange &&
        mainController.offset < 0 &&
        !showDivider) {
      showDivider = true;
    }
    if (mainController.position.atEdge &&
        !showDivider &&
        mainController.offset == 0) {
      showDivider = true;
    }
  }

  bool _showDivider = true;

  bool get showDivider => _showDivider;

  set showDivider(bool value) {
    _showDivider = value;
    notifyListeners();
  }
}
