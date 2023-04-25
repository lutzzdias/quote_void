import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/widgets/custom_outlined_button.dart';
import 'package:quote_void/src/widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/routing/app_router.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required this.onSubmit,
  });

  final void Function(String, String) onSubmit;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _emailOrUsername = '';
  String _password = '';

  Future<void> _submit() async {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_emailOrUsername, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Email address or username',
            ),
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _emailOrUsername = value,
            // TODO: Move validation to appropriate place in the architecture
            // TODO: Make validation work for email AND username
            validator: (emailOrUsername) {
              if (emailOrUsername == null || emailOrUsername.isEmpty) {
                return 'Email address cannot be empty.';
              } else if (emailOrUsername.length < 4) {
                return 'Email address must be at least 4 characters long.';
              } else if (!emailOrUsername.contains('@')) {
                return 'Email address must contain an \'@\' symbol.';
              } else if (RegExp(r'[^a-zA-Z0-9@.]').hasMatch(emailOrUsername)) {
                return 'Invalid characters in email address.';
              } else if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(emailOrUsername)) {
                return 'Invalid email address format.';
              } else {
                return null;
              }
            },
          ),
          gapH16,
          PasswordField(
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _password = value,
            // TODO: Move validation to appropriate place in the architecture
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Password cannot be empty.';
              } else {
                return null;
              }
            },
          ),
          // TODO: Create logic to have button in the screen, not on this widget
          gapH12,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.pushNamed(AppRoute.forgotPassword.name),
              child: const Text(
                'Forgot password?',
                style: AppTextStyle.link,
              ),
            ),
          ),
          gapH24,
          CustomOutlinedButton(
            title: 'Sign In',
            onPressed: () => _submit(),
          ),
        ],
      ),
    );
  }
}
