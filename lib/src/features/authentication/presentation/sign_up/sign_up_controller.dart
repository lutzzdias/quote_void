import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/application/auth_service.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class SignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required String imageUrl,
  }) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authService.signUp(
          name: name,
          username: username,
          email: email,
          password: password,
          imageUrl: imageUrl,
        ));
  }
}

final signUpControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignUpController, void>(
  SignUpController.new,
);
