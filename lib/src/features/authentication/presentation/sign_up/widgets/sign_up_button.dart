import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';

class SignUpButton extends ConsumerWidget {
  // TODO: Discover why passing the email and password did not work
  // Before passing the onPressed, the email and password were passed and the onPressed logic was in this widget,
  // however, the email and password were always empty strings, idk why
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// Deal with errors
    ref.listen<AsyncValue<void>>(
      signUpControllerProvider,
      (_, state) => state.whenOrNull(
        error: (error, _) {
          print('erro: ${error.toString()}');
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

// TODO: Listen for errors
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
