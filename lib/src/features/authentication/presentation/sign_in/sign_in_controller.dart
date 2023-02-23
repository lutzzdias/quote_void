import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignInController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  // TODO: Fix bug where signIn does not update user
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => authRepository.signInWithEmailAndPassword(email, password),
    );
  }

  Future<void> signInWithGoogle() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(() => authRepository.signInWithGoogle());
  }
}

final signInControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInController, void>(
  SignInController.new,
);
