import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () => authRepository.signUpWithEmailAndPassword(email, password),
    );
  }
}

final signUpControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignUpController, void>(
  SignUpController.new,
);
