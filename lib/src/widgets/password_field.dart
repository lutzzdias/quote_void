import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  // TODO: Add state management and possibility of toggle text visibility
  const PasswordField({
    super.key,
    required this.autovalidateMode,
    required this.validator,
    required this.onChanged,
  });

  final AutovalidateMode autovalidateMode;
  final String? Function(String?) validator;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
