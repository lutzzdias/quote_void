import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/application/auth_service.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignInController extends AutoDisposeAsyncNotifier<void> {
  late final AuthService _authService;

  @override
  FutureOr<void> build() => _authService = ref.read(authServiceProvider);

  Future<void> signIn({
    String? email,
    String? password,
  }) async {
    state = const AsyncValue.loading();
    if (email != null && password != null) {
      state = await AsyncValue.guard(
        () => _authService.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } else {
      state = await AsyncValue.guard(
        () => _authService.signInWithGoogle(),
      );
    }
  }
}

final signInControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInController, void>(
  SignInController.new,
);
