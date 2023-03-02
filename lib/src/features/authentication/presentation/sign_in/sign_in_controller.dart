import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignInController extends AutoDisposeAsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() => _authRepository = ref.read(authRepositoryProvider);

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _authRepository.signInWithEmailAndPassword(email, password),
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    // TODO: Create user info in firebase
    state = await AsyncValue.guard(() => _authRepository.signInWithGoogle());
  }
}

final signInControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInController, void>(
  SignInController.new,
);
