import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

// TODO: Improve spacing
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          const Spacer(
            flex: 7,
          ),
          Expanded(
            flex: 58,
            child: SignUpForm(
              onSubmit: (values) =>
                  ref.read(signUpControllerProvider.notifier).signUp(
                        name: values['name']!,
                        username: values['username']!,
                        email: values['email']!,
                        password: values['password']!,
                        // TODO: Get image
                        imageUrl: values['imageUrl']!,
                      ),
            ),
          ),
          const Spacer(flex: 10),
          TextWithLink(
            text: 'Already have an account? ',
            linkText: 'Sign in',
            onTap: () => context.goNamed(AppRoute.signIn.name),
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
