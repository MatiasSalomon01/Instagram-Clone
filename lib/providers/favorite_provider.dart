import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  bool _show = false;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }

  bool _animate = false;

  bool get animate => _animate;

  // set animate(bool value) {
  //   _animate = value;
  //   notifyListeners();
  // }

  // bool get animate => _animate;

  startAnimation() {
    if (!_show) {
      _animate = !_animate;
      // _animate = !_animate;
      notifyListeners();
      // notifyListeners();
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _animate = !_animate;
          notifyListeners();
        },
      );
    }
    show = !_show;
  }
}
