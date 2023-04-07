import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
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
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: isVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () => setState(() => isVisible = !isVisible),
          child: const Icon(Icons.remove_red_eye),
        ),
      ),
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
