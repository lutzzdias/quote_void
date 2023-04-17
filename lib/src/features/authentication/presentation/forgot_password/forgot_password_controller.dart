import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class ForgotPasswordController extends AutoDisposeAsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() => _authRepository = ref.read(authRepositoryProvider);

  Future<AsyncValue<void>> resetPassword({
    required String email,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _authRepository.resetPassword(email: email),
    );
    return state;
  }
}

final forgotPasswordControllerProvider =
    AutoDisposeAsyncNotifierProvider<ForgotPasswordController, void>(
  ForgotPasswordController.new,
);
