import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/features/home/home_screen.dart';

enum AppRoute {
  home,
}

final goRouter = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  // TODO: Search about redirect
  // redirect: (context, state) => null,
  // TODO: Search about refreshListenable
  // refreshListenable: null,
  routes: [
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        // TODO: Search about fullscreenDialog
        fullscreenDialog: true,
        child: HomeScreen(),
      ),
    )
  ],
);
