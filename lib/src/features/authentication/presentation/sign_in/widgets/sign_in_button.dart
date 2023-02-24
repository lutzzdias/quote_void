import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';

class SignInButton extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// TODO: Improve error handling with asyncValue
    ref.listen<AsyncValue<void>>(
      signInControllerProvider,
      (_, state) => state.whenOrNull(
        // TODO: Improve error snackbar UI
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.toString(),
              ),
            ),
          );
        },
      ),
    );

    final signInState = ref.watch(signInControllerProvider);
    final isLoading = signInState is AsyncLoading<void>;

    return CustomOutlinedButton(
      title: 'Sign in',
      isLoading: isLoading,
      onPressed: isLoading
          ? null
          : () => ref
              .read(signInControllerProvider.notifier)
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text),
    );
  }
}
