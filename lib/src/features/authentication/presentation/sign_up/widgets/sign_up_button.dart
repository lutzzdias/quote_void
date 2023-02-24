import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';

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
// TODO: Improve error handling with asyncValue
    ref.listen<AsyncValue<void>>(
      signUpControllerProvider,
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

    final signUpState = ref.watch(signUpControllerProvider);
    final isLoading = signUpState is AsyncLoading<void>;

    return CustomOutlinedButton(
      title: 'Sign up',
      isLoading: isLoading,
      onPressed: isLoading
          ? null
          : () => ref
              .read(signUpControllerProvider.notifier)
              .signUpWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text),
    );
  }
}
