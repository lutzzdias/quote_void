import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/constants/icons/auth_icons.dart';
import 'package:quote_void/src/utils/async_value_ui.dart';
import 'package:quote_void/src/widgets/custom_outlined_icon_button.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
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

    return Scaffold(
      body: ResponsiveCenter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            gapH12,
            const Text(
              'Quote Void',
              textAlign: TextAlign.center,
              style: AppTextStyle.title,
            ),
            // TODO: Modularize following widget -> perhaps deal with error and loading states differently
            gapH64,
            Consumer(
              builder: (_, ref, __) {
                ref.listen<VoidAsyncValue>(
                  signInControllerProvider,
                  (_, state) => state.showSnackBarOnError(context),
                );
                final state = ref.watch(signInControllerProvider);
                return state.when(
                  skipError: true,
                  data: (_) => Column(
                    children: [
                      SignInForm(
                        onSubmit: (email, password) => signIn(
                          email: email,
                          password: password,
                        ),
                      ),
                      gapH24,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomOutlinedIconButton(
                              title: 'Google',
                              icon: AuthIcons.google,
                              onPressed: () => signInWithGoogle(),
                            ),
                          ),
                          gapW16,
                          Expanded(
                            child: CustomOutlinedIconButton(
                              title: 'Apple ID',
                              icon: AuthIcons.apple,
                              onPressed: () => debugPrint(
                                  'This requires an apple developer account (100U\$/yr)'),
                            ),
                          ),
                        ],
                      ),
                      gapH64,
                      TextWithLink(
                        text: 'Don\'t have an account? ',
                        linkText: 'Sign up',
                        onTap: () => context.goNamed(AppRoute.signUp.name),
                      ),
                    ],
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => const Expanded(
                    flex: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
