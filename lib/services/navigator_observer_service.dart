import 'package:flutter/widgets.dart';

class NavigatorObserverService extends NavigatorObserver {
  static String currentRoute = "";

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    currentRoute = route.settings.name ?? "";
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    currentRoute = previousRoute?.settings.name ?? "";
  }
}
