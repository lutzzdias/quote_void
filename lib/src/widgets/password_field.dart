import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
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
      autocorrect: false,
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () => setState(() => isVisible = !isVisible),
          child: Icon(
            !isVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      autovalidateMode: widget.autovalidateMode,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
