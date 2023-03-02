import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';
import 'package:quote_void/src/common_widgets/text_with_link.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:quote_void/src/features/authentication/presentation/widgets/auth_button.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_up/sign_up_controller.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignUpScreen extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({super.key});

  String get email => _emailController.text;
  String get password => _passwordController.text;

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
              nameController: _nameController,
              usernameController: _usernameController,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          ),
          const Spacer(flex: 13),
          AuthButton(
            title: 'Sign up',
            onPressed: () => ref.read(signUpControllerProvider.notifier).signUp(
                  name: _nameController.text,
                  username: _usernameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  imageUrl:
                      'https://images.vexels.com/media/users/3/129616/isolated/preview/fb517f8913bd99cd48ef00facb4a67c0-businessman-avatar-silhouette-by-vexels.png',
                ),
            provider: signUpControllerProvider,
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
