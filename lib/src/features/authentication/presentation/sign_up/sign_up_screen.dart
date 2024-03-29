import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/widgets/responsive_center.dart';
import 'package:quote_void/src/widgets/text_with_link.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ResponsiveCenter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignUpForm(),
                  gapH64,
                  TextWithLink(
                    text: 'Already have an account? ',
                    linkText: 'Sign in',
                    onTap: () => context.goNamed(AppRoute.signIn.name),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
