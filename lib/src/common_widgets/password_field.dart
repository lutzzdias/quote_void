import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  // TODO: Add state management and possibility of toggle text visibility
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
