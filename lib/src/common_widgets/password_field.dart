import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  // TODO: Add state management and possibility of toggle text visibility
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
