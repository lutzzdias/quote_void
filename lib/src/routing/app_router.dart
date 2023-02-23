import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:quote_void/src/features/authentication/presentation/forgot_password/forgot_password_screen.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_screen.dart';
import 'package:quote_void/src/features/category/presentation/categories_list/categories_list_screen.dart';
import 'package:quote_void/src/features/home/home_screen.dart';
import 'package:quote_void/src/routing/go_router_refresh_stream.dart';

enum AppRoute {
  home,
  signIn,
  signUp,
  forgotPassword,
  categoryList,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final bool isLoggedIn = authRepository.currentUser != null;

      if (isLoggedIn) {
        if (state.subloc.startsWith('/authentication')) {
          return '/';
        }
      } else if (!state.subloc.startsWith('/authentication')) {
        return '/authentication/signIn';
      } else {
        return state.fullpath;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
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
      GoRoute(
        path: '/category/list',
        name: AppRoute.categoryList.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: CategoriesListScreen(),
        ),
      ),
    ],
  );
});
