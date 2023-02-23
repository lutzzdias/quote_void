import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_button.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_icon_button.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/password_field.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Fix screen slight resize on keyboard appearance
    // TODO: Add custom icons for the buttons
    // TODO: Make UI reactive to loading state
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 15,
          ),
          SizedBox(
            height: 132,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          gapH12,
          const Text(
            'Quote Void',
            textAlign: TextAlign.center,
            style: AppTextStyle.title,
          ),
          const Spacer(
            flex: 25,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email address or username',
            ),
          ),
          gapH16,
          PasswordField(
            passwordController: _passwordController,
          ),
          gapH12,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.pushNamed(AppRoute.forgotPassword.name),
              child: const Text(
                'Forgot password?',
                style: AppTextStyle.link,
              ),
            ),
          ),
          const Spacer(
            flex: 20,
          ),
          CustomOutlinedButton(
            title: 'Sign in',
            onPressed: () => ref
                .read(signInControllerProvider.notifier)
                .signInWithEmailAndPassword(email: email, password: password),
          ),
          gapH12,
          const Text(
            'Or',
            style: AppTextStyle.bodyTranslucent,
            textAlign: TextAlign.center,
          ),
          gapH12,
          CustomOutlinedIconButton(
            title: 'Google',
            icon: Icons.android,
            onPressed: () =>
                ref.read(signInControllerProvider.notifier).signInWithGoogle(),
          ),
          gapH16,
          CustomOutlinedIconButton(
            title: 'Apple ID',
            icon: Icons.apple,
            onPressed: () async => await ref
                .read(signInControllerProvider.notifier)
                .signOutGoogle(),
          ),
          const Spacer(
            flex: 35,
          ),
          TextWithLink(
            text: 'Don\'t have an account? ',
            linkText: 'Sign up',
            onTap: () => context.goNamed(AppRoute.signUp.name),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
