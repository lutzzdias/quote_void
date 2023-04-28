import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:quote_void/src/features/authentication/data/user_repository.dart';
import 'package:quote_void/src/features/authentication/domain/app_user.dart';

class AuthService {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthService({required this.authRepository, required this.userRepository});

  Future<void> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required String imageUrl,
  }) async {
    UserCredential result =
        await authRepository.signUpWithEmailAndPassword(email, password);

    final AppUser user = AppUser(
      id: result.user!.uid,
      name: name,
      username: username,
      email: email,
      imageUrl: imageUrl,
    );

    userRepository.createUser(user: user);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await authRepository.signInWithEmailAndPassword(email, password);

  Future<void> signInWithGoogle() async {
    UserCredential result = await authRepository.signInWithGoogle();

    if (result.additionalUserInfo!.isNewUser) {
      userRepository.createUser(
        // Deal with null values (create screen that requires user to add necessary fields and store them in the document in firestore)
        user: AppUser(
          id: result.user!.uid,
          name: result.user!.displayName ?? '',
          username: result.additionalUserInfo!.username ?? '',
          email: result.user!.email ?? '',
          imageUrl: result.user!.photoURL ?? '',
        ),
      );
    }
  }
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
