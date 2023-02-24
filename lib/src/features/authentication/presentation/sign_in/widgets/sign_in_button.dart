import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';

class SignInButton extends ConsumerWidget {
  // TODO: Discover why passing the email and password did not work
  // Before passing the onPressed, the email and password were passed and the onPressed logic was in this widget,
  // however, the email and password were always empty strings, idk why
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInControllerProvider);
    final isLoading = signInState is AsyncLoading<void>;

// TODO: Listen for errors
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
