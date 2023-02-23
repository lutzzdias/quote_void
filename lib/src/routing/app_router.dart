import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/features/authentication/presentation/forgot_password/forgot_password_screen.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_screen.dart';
import 'package:quote_void/src/features/home/home_screen.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
  forgotPassword,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // TODO: check if user is logged in
    const bool isLoggedIn = false;

    if (isLoggedIn) {
      if (state.subloc.startsWith('/authentication')) {
        return '/';
      }
    } else if (!state.subloc.startsWith('/authentication')) {
      return '/authentication/signIn';
    } else {
      return state.fullpath;
    }
  },
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
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/authentication/signIn',
      name: AppRoute.signIn.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: SignInScreen(),
      ),
    ),
    GoRoute(
      path: '/authentication/signUp',
      name: AppRoute.signUp.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: SignUpScreen(),
      ),
    ),
    GoRoute(
      path: '/authentication/forgotPassword',
      name: AppRoute.forgotPassword.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ForgotPasswordScreen(),
      ),
    ),
  ],
);
