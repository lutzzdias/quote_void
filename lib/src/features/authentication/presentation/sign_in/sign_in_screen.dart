import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_outlined_icon_button.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Add custom icons for the buttons

    Future<void> _signIn(String email, String password) async {
      await ref
          .read(signInControllerProvider.notifier)
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    }

    // TODO: Improve spacing
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 12,
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
            flex: 15,
          ),
          Expanded(
            flex: 48,
            child: SignInForm(
              onSubmit: (email, password) => _signIn(email, password),
            ),
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
            onPressed: () => debugPrint(
                'This requires an apple developer account (100U\$/yr)'),
          ),
          const Spacer(
            flex: 20,
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
