import 'package:flutter/material.dart';
import 'package:quote_void/src/common_widgets/custom_scaffold.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: const Text('Sign Up'),
      ),
    );
  }
}
