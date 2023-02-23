import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';

class AccountScreenController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    if (authRepository.currentUser!.providerData.first.providerId ==
        'google.com') {
      state = await AsyncValue.guard(() => authRepository.signOutGoogle());
    } else {
      state = await AsyncValue.guard(() => authRepository.signOut());
    }
  }
}

final accountScreenControllerProvider =
    AutoDisposeAsyncNotifierProvider<AccountScreenController, void>(
        AccountScreenController.new);
