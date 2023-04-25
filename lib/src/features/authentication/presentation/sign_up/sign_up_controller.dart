import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/application/auth_service.dart';
import 'package:uuid/uuid.dart';

class SignUpController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required File profilePic,
  }) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    TaskSnapshot task = await FirebaseStorage.instance
        .ref()
        .child('profile-pics')
        .child('$username-${const Uuid().v4()}')
        .putFile(profilePic);
    final url = await task.ref.getDownloadURL();
    state = await AsyncValue.guard(() => authService.signUp(
          name: name,
          username: username,
          email: email,
          password: password,
          imageUrl: url,
        ));
  }
}

final signUpControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignUpController, void>(
  SignUpController.new,
);
