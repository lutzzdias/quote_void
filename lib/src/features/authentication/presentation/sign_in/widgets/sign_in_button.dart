import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:quote_void/src/utils/async_value_ui.dart';

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
    ref.listen<VoidAsyncValue>(
      signInControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final signInState = ref.watch(signInControllerProvider);

    return CustomOutlinedButton(
      title: 'Sign in',
      isLoading: signInState.isLoading,
      onPressed: signInState.isLoading
          ? null
          : () => ref
              .read(signInControllerProvider.notifier)
              .signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              ),
    );
  }
}
