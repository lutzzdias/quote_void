import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:quote_void/src/features/home/home_screen.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  // TODO: Implement redirect logic for when the user tries to access routes and is not logged in
  // redirect: (context, state) => null,
  // Changes on the listenable will cause the router to refresh it's route
  // TODO: Implement provider which will notify when the user is updated
  // refreshListenable: null,
  routes: [
    GoRoute(
        path: '/',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              // fullscreenDialog -> makes the appBar have a close button instead of a back button
              // on iOS the screen is not closeable with the swipe gesture
              child: HomeScreen(),
            ),
        routes: [
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: SignInScreen(),
            ),
          )
        ]),
  ],
);
