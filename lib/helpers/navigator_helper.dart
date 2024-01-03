import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/routes/routes.dart';
import 'package:provider/provider.dart';

PageRouteBuilder<dynamic> navigateTo(String routeName) {
  return PageRouteBuilder(
    pageBuilder: (context, __, ___) {
      context.read<NavigatorProvider>().routeName = routeName;
      return Routes.map[routeName]!;
    },
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
  );
}
