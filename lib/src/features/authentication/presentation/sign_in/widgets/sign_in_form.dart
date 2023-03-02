import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_void/src/common_widgets/password_field.dart';
import 'package:quote_void/src/constants/app_sizes.dart';
import 'package:quote_void/src/constants/theme/app_text_style.dart';
import 'package:quote_void/src/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:quote_void/src/features/authentication/presentation/widgets/auth_button.dart';
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
            decoration: const InputDecoration(
              hintText: 'Email address or username',
            ),
            autovalidateMode: _submitted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            onChanged: (value) => _emailOrUsername = value,
            validator: (emailOrUsername) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              // TODO: Email validation with Regex or package (?)
              if (emailOrUsername == null || emailOrUsername.isEmpty) {
                return 'Can\'t be empty';
              } else if (emailOrUsername.length < 2) {
                return 'Too short';
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
            validator: (password) {
              // TODO: Improve validation messages
              // TODO: Check for special characters
              if (password == null || password.isEmpty) {
                return 'Can\'t be empty';
              } else if (password.length < 6) {
                return 'Too short';
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
          AuthButton(
            title: 'Sign In',
            onPressed: () => _submit(),
            provider: signInControllerProvider,
          ),
        ],
      ),
    );
  }
}
