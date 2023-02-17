import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_void/src/common_widgets/colored_safe_area.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredSafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(),
            Text(
              'Quote Void',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email address or username',
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            const Text(
              'Forgot password',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Sign In'),
            ),
            const Text('Or'),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('Google'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('Apple ID'),
            ),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
