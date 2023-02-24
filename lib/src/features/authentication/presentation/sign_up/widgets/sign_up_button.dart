import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/utils/async_value_ui.dart';

class SignUpButton extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<VoidAsyncValue>(
      signUpControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final signUpState = ref.watch(signUpControllerProvider);

    return CustomOutlinedButton(
      title: 'Sign up',
      isLoading: signUpState.isLoading,
      onPressed: signUpState.isLoading
          ? null
          : () => ref
              .read(signUpControllerProvider.notifier)
              .signUpWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text),
    );
  }
}
