import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(),
          Text(
            'Quote Void',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email address or username',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          Text(
            'Forgot password',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Sign In'),
          ),
          Text('Or'),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.abc),
            label: Text('Google'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.abc),
            label: Text('Apple ID'),
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
    );
  }
}
