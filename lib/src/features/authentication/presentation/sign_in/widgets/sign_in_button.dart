import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';

class SignInButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInControllerProvider);
    final isLoading = signInState is AsyncLoading<void>;

// TODO: Listen for errors
    return CustomOutlinedButton(
      title: 'Sign in',
      isLoading: isLoading,
      onPressed: isLoading ? null : onPressed,
    );
  }
}
