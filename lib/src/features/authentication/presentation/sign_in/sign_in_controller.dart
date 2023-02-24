import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignInController extends AutoDisposeAsyncNotifier<AsyncValue> {
  @override
  FutureOr<AsyncValue> build() => const AsyncValue.data(null);

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => authRepository.signInWithEmailAndPassword(email, password),
    );
  }

  Future<void> signInWithGoogle() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => authRepository.signInWithGoogle(),
    );
  }
}

final signInControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInController, AsyncValue<void>>(
  SignInController.new,
);
