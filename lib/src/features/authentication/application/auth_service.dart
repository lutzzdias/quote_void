import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:quote_void/src/features/authentication/data/user_repository.dart';
import 'package:quote_void/src/features/authentication/domain/app_user.dart';

class AuthService {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthService({required this.authRepository, required this.userRepository});

  Future<AsyncValue> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
    required String imageUrl,
  }) async {
    AsyncValue result =
        await authRepository.signUpWithEmailAndPassword(email, password);

    final AppUser user = AppUser(
      id: result.asData?.value.user.uid,
      name: name,
      username: username,
      email: email,
      imageUrl: imageUrl,
    );

    await userRepository.createUser(user: user);

    return result;
  }
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  ),
);
