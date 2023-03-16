import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/widgets/custom_outlined_icon_button.dart';
import 'package:quote_void/src/widgets/custom_scaffold.dart';
import 'package:quote_void/src/widgets/text_with_link.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Add custom icons for the buttons

    Future<void> signIn(
        {required String email, required String password}) async {
      await ref.read(signInControllerProvider.notifier).signIn(
            email: email,
            password: password,
          );
    }

    Future<void> signInWithGoogle() async {
      await ref.read(signInControllerProvider.notifier).signInWithGoogle();
    }

    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 25,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
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
          Consumer(
            builder: (_, ref, __) => Expanded(
              flex: 200,
              child: Column(
                children: [
                  SignInForm(
                    onSubmit: (email, password) => signIn(
                      email: email,
                      password: password,
                    ),
                  ),
                  const Spacer(flex: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomOutlinedIconButton(
                          title: 'Google',
                          icon: Icons.android,
                          onPressed: () => signInWithGoogle(),
                        ),
                      ),
                      gapW16,
                      Expanded(
                        child: CustomOutlinedIconButton(
                          title: 'Apple ID',
                          icon: Icons.apple,
                          onPressed: () => debugPrint(
                              'This requires an apple developer account (100U\$/yr)'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 25,
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
            ),
          ),
        ],
      ),
    );
  }
}
